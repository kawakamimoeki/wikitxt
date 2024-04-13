require "thor"
require 'webrick'
require 'erb'
require 'fileutils'

module Wikitxt
  class CLI < Thor
    package_name "wikitxt"
    map "s" => :server

    desc "server [PATH]", "start wiki site"
    def server(path)
      files = Dir.glob(File.join(path, "*.txt"))
      pages = []
      files.each do |file|
        text = File.read(file)
        body = Wikitxt.to_html(text)
        title = File.basename(file, ".txt")
        pages << title
        html = ERB.new(File.read(File.join(__dir__, "../", "html", "layout.html.erb"))).result_with_hash({ body: body, title: title })
        Dir.mkdir("dist") unless Dir.exist?("dist")
        File.write(File.join("dist", "#{title}.html"), html)
      end
      index = ERB.new(File.read(File.join(__dir__, "../", "html", "index.html.erb"))).result_with_hash({ pages: pages })
      html = ERB.new(File.read(File.join(__dir__, "../", "html", "layout.html.erb"))).result_with_hash({ body: index, title: "Index" })
      File.write(File.join("dist", "index.html"), html)
      images = Dir.glob(File.join(path, "*.{png,jpg,jpeg}"))
      FileUtils.cp(images, "dist")
      server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => "dist"
      trap 'INT' do server.shutdown end
      server.start
    end
  end
end
