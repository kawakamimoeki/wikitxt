require "thor"
require 'webrick'

module Wikitxt
  class CLI < Thor
    package_name "wikitxt"
    map "s" => :server

    desc "server [PATH]", "start wiki site"
    def server(path)
      files = Dir.glob(File.join(path, "*.txt"))
      files.each do |file|
        text = File.read(file)
        html = Wikitxt.to_html(text)
        File.open(File.join("tmp", "#{File.basename(file, ".txt")}.html"), "w+") do |f|
          f.write(html)
        end
      end
      server = WEBrick::HTTPServer.new :Port => 8000, :DocumentRoot => "tmp"
      trap 'INT' do server.shutdown end
      server.start
    end
  end
end
