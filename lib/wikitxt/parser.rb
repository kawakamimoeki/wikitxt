# frozen_string_literal: true

module Wikitxt
  class Parser
    attr_accessor :text

    def initialize(text)
      @text = text
    end

    def body
      b = BodyNode.new

      lines.each do |line|
        if match = line.match(/^(?<indent> {2,})(?<text>.*)$/)
          b.children << ListNode.new(text: match[:text], indent: match[:indent].length - 2)
          next
        end

        b.children << TextNode.new(text: line.chomp)
      end

      b
    end

    private

    def lines
      text.lines
    end
  end
end
