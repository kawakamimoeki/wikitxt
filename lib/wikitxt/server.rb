require 'sinatra'
require 'wikitxt'

get "/" do
  pages = Dir.glob(File.join(ENV["DIR"], "*.txt")).map { File.basename(_1, ".txt") }
  title = "Index"
  body = ERB.new(File.read(File.join(__dir__, "views", "index.erb"))).result_with_hash({ pages: pages })
  ERB.new(File.read(File.join(__dir__, "views", "layout.erb"))).result_with_hash({ body: body, title: title })
end

get "/:page" do
  page = params[:page]

  if page.match?(/\.(png|jpeg|jpg)/)
    pass unless File.exist?(File.join(ENV["DIR"], page))
    send_file File.join(ENV["DIR"], page)
  end

  page = File.basename(page, ".html")
  file = File.join(ENV["DIR"], "#{page}.txt")
  pass unless File.exist?(file)
  text = File.read(file)
  title = File.basename(file, ".txt")
  body = Wikitxt.to_html(text)
  ERB.new(File.read(File.join(__dir__, "views", "layout.erb"))).result_with_hash({ body: body, title: title })
end

not_found do
  ERB.new(File.read(File.join(__dir__, "views", "layout.erb"))).result_with_hash({ body: "Not found", title: "Not found" })
end
