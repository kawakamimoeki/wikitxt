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
      <div class="list">foo</div>
      </div>
      <div class="line">
      <div class="dot" style="margin-left: 10px;"></div>
      <div class="list">bar</div>
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
      <div class="text">foo</div>
      </div>
      <div class="line">
      <div class="text">bar</div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end

  it "renders list and text" do
    text = <<-TXT
foo
bar
  forge
    relaxation
    TXT
    html = <<~HTML
      <div class="line">
      <div class="text">foo</div>
      </div>
      <div class="line">
      <div class="text">bar</div>
      </div>
      <div class="line">
      <div class="dot" style="margin-left: 0px;"></div>
      <div class="list">forge</div>
      </div>
      <div class="line">
      <div class="dot" style="margin-left: 10px;"></div>
      <div class="list">relaxation</div>
      </div>
    HTML
    expect(Wikitxt::Renderer.new(text).render).to eq(html)
  end
end
