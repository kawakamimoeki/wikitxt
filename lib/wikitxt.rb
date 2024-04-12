# frozen_string_literal: true

require_relative "wikitxt/version"
require_relative "wikitxt/node"
require_relative "wikitxt/parser"
require_relative "wikitxt/renderer"

module Wikitxt
  class Error < StandardError; end
  # Your code goes here...

  def self.to_html(text)
    Renderer.new(text).render
  end
end
