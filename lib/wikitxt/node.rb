# frozen_string_literal: true

module Wikitxt
  class BaseNode
    attr_accessor :attrs, :children

    def initialize(**attrs)
      @attrs = attrs
      @children = []
    end
  end

  class BodyNode < BaseNode
    def to_html
      children.map(&:to_html).join
    end
  end

  class TextNode < BaseNode
    def to_html
      <<~HTML
        <div class="line">
        <div class="text">#{attrs[:text]}</div>
        </div>
      HTML
    end
  end

  class ListNode < BaseNode
    def to_html
      <<~HTML
        <div class="line">
        <div class="dot" style="margin-left: #{attrs[:indent] * 5}px;"></div>
        <div class="list">#{attrs[:text]}</div>
        </div>
      HTML
    end
  end
end
