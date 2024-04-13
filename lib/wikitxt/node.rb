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

  class ParagraphNode < BaseNode
    def to_html
      <<~HTML
        <div class="line">
        <div class="text">#{Parser::Inline.new(self).to_html}</div>
        </div>
      HTML
    end
  end

  class ListNode < BaseNode
    def to_html
      <<~HTML
        <div class="line">
        <div class="dot" style="margin-left: #{attrs[:indent] * 5}px;"></div>
        <div class="list">#{Parser::Inline.new(self).to_html}</div>
        </div>
      HTML
    end
  end

  class TextNode < BaseNode
    def to_html
      "<span>#{attrs[:text]}</span>"
    end
  end

  class LinkNode < BaseNode
    def to_html
      " <a href=\"/#{attrs[:page]}.html\">#{attrs[:page]}</a>"
    end
  end
end
