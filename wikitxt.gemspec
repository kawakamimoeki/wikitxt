# frozen_string_literal: true

require_relative "lib/wikitxt/version"

Gem::Specification.new do |spec|
  spec.name = "wikitxt"
  spec.version = Wikitxt::VERSION
  spec.authors = ["Moeki Kawakami"]
  spec.email = ["moeki.kawakami@icloud.com"]

  spec.summary = "Most lightweight wiki writen by plain text."
  spec.description = "Most lightweight wiki writen by plain text."
  spec.homepage = "https://github.com/kawakamimoeki/wikitxt"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kawakamimoeki/wikitxt"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra", "~> 4.0"

end
