# frozen_string_literal: true

module Wikitxt
  class Parser
    class Block
      attr_accessor :text

      def initialize(text)
        @text = text
      end

      def body
        b = BodyNode.new

        text.lines.each do |line|
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
          if result = scanner.scan(/(^| )#\S+( |$)/)
            parent.children << pending if pending
            pending = nil
            match = result.match(/(^| )#(?<page>\S+)( |$)/)
            parent.children << LinkNode.new(page: match[:page])
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
