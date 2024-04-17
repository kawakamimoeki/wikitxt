# frozen_string_literal: true

RSpec.describe Wikitxt::Renderer do
  it "renders list" do
    text = <<-TXT
  foo
    bar
    TXT
    html = <<~HTML
      <div class="line">
      <div style="margin-left: 0px;"></div>
      <div class="list"><span>foo</span></div>
      </div>
      <div class="line">
      <div style="margin-left: 20px;"></div>
      <div class="list"><span>bar</span></div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end

  it "renders text" do
    text = <<-TXT
foo
bar
    TXT
    html = <<~HTML
      <div class="line">
      <div class="text"><span>foo</span></div>
      </div>
      <div class="line">
      <div class="text"><span>bar</span></div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end

  it "renders internal link" do
    text = <<-TXT
foo #bar baz
    TXT
    html = <<~HTML
      <div class="line">
      <div class="text"><span>foo</span> <a href="/bar.html">bar</a> <span>baz</span></div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end

  it "renders internal image" do
    text = <<-TXT
#image.png
    TXT
    html = <<~HTML
      <div class="line">
      <div class="text"><img src="/image.png" /></div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end

  it "renders external link" do
    text = <<-TXT
External Link: https://example.com
    TXT
    html = <<~HTML
      <div class="line">
      <div class="text"><span>External Link: </span> <a href="https://example.com">https://example.com</a> </div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end

  it "renders external image" do
    text = <<-TXT
External Image: https://example.com/image.png
    TXT
    html = <<~HTML
      <div class="line">
      <div class="text"><span>External Image: </span><img src="https://example.com/image.png" /></div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end

  it "excapes html tags" do
    text = <<-TXT
This is <pre> pre </pre> tag.
    TXT
    html = <<~HTML
      <div class="line">
      <div class="text"><span>This is &lt;pre&gt; pre &lt;/pre&gt; tag.</span></div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end

  it "renders pre block" do
    text = <<-TXT
---
class Hoge; end
---
    TXT
    html = <<~HTML
      <pre>class Hoge; end
      </pre>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end
end
