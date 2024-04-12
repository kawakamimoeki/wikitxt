# frozen_string_literal: true

RSpec.describe Wikitxt::Renderer do
  it "renders list" do
    text = <<-TXT
  foo
    bar
    TXT
    html = <<~HTML
      <div class="line">
      <div class="dot" style="margin-left: 0px;"></div>
      <div class="list"><span>foo</span></div>
      </div>
      <div class="line">
      <div class="dot" style="margin-left: 10px;"></div>
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

  it "renders link" do
    text = <<-TXT
foo #bar baz
    TXT
    html = <<~HTML
      <div class="line">
      <div class="text"><span>foo</span><a href="/bar.html">bar</a><span>baz</span></div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end
end
