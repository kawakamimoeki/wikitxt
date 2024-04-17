# frozen_string_literal: true

require 'uri'

module Wikitxt
  class Parser
    class Block
      attr_accessor :text

      def initialize(text)
        @text = text
      end

      def body
        b = BodyNode.new
        in_pre = false

        text.lines.each do |line|
          if line == "---\n"
            node = !in_pre ? PreStartNode.new : PreEndNode.new
            b.children << node
            in_pre = !in_pre
            next
          end

          if in_pre
            b.children << PreNode.new(text: line)
            next
          end

          if match = line.match(/^(?<indent> {2,})(?<text>.*)$/)
            b.children << ListNode.new(text: match[:text], indent: match[:indent].length - 2)
            next
          end

          b.children << ParagraphNode.new(text: line.chomp)
        end

        b
      end
    end

    class Inline
      attr_accessor :parent

      def initialize(parent)
        @parent = parent
      end

      def to_html
        pending = nil

        scanner = StringScanner.new(parent.attrs[:text])

        until scanner.eos? do
          if result = scanner.scan(URI.regexp(["http", "https"]))
            parent.children << pending if pending
            pending = nil
            if result.match(/\.(png|jpg|jpeg|svg)/)
              parent.children << ImageNode.new(url: result)
              next
            end
            parent.children << LinkNode.new(url: result)
            next
          end

          if result = scanner.scan(/(^| )#\S+( |$)/)
            parent.children << pending if pending
            pending = nil
            match = result.match(/(^| )#(?<url>\S+)( |$)/)
            if match[:url].match(/\.(png|jpg|jpeg|svg)/)
              parent.children << ImageNode.new(url: "/#{match[:url]}")
              next
            end
            parent.children << LinkNode.new(url: "/#{match[:url]}.html", title: match[:url])
            next
          end

          if pending
            pending.attrs[:text] += scanner.scan(/./)
            next
          end

          pending = TextNode.new(text: scanner.scan(/./))
        end

        parent.children << pending if pending

        parent.children.map(&:to_html).join
      end
    end
  end
end
