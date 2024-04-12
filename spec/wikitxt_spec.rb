# frozen_string_literal: true

RSpec.describe Wikitxt do
  it "has a version number" do
    expect(Wikitxt::VERSION).not_to be nil
  end

  it "renders list and text" do
    text = <<-TXT
foo
#bar
  forge
    relaxation
    TXT
    html = <<~HTML
      <div class="line">
      <div class="text"><span>foo</span></div>
      </div>
      <div class="line">
      <div class="text"><a href="/bar.html">bar</a></div>
      </div>
      <div class="line">
      <div class="dot" style="margin-left: 0px;"></div>
      <div class="list"><span>forge</span></div>
      </div>
      <div class="line">
      <div class="dot" style="margin-left: 10px;"></div>
      <div class="list"><span>relaxation</span></div>
      </div>
    HTML
    expect(Wikitxt.to_html(text)).to eq(html)
  end
end
