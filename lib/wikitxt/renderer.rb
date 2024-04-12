# frozen_string_literal: true

module Wikitxt
  class Renderer
    attr_accessor :text

    def initialize(text)
      @text = text
      @parser = Parser.new(text)
    end

    def render
      @parser.body.to_html
    end

    private

    def lines
      text.lines
    end
  end
end
