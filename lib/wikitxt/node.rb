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
        <div style="margin-left: #{attrs[:indent] * 10}px;"></div>
        <div class="list">#{Parser::Inline.new(self).to_html}</div>
        </div>
      HTML
    end
  end

  class TextNode < BaseNode
    def to_html
      "<span>#{CGI.escapeHTML(attrs[:text])}</span>"
    end
  end

  class LinkNode < BaseNode
    def to_html
      " <a href=\"#{attrs[:url]}\">#{attrs[:title] ? CGI.escapeHTML(attrs[:title]) : attrs[:url]}</a> "
    end
  end

  class ImageNode < BaseNode
    def to_html
      "<img src=\"#{attrs[:url]}\" />"
    end
  end

  class CodeNode < BaseNode
    def to_html
      <<~HTML
        <div class="line">
        <code><pre>#{CGI.escapeHTML(attrs[:text])}</pre></code>
        </div>
      HTML
    end
  end

  class PreStartNode < BaseNode
    def to_html
      "<pre>"
    end
  end

  class PreEndNode < BaseNode
    def to_html
      "</pre>\n"
    end
  end

  class PreNode < BaseNode
    def to_html
      CGI.escapeHTML(attrs[:text])
    end
  end
end
