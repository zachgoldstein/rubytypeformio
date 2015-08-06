# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubytypeformio/version'

Gem::Specification.new do |spec|
  spec.name          = "rubytypeformio"
  spec.version       = Rubytypeformio::VERSION
  spec.authors       = ["Zachary Goldstein"]
  spec.email         = ["zachgold@gmail.com"]

  spec.summary       = %q{A simple API wrapper for typeformio.}
  spec.description   = %q{A simple API wrapper for typeformio.}
  spec.homepage      = "https://github.com/zachgoldstein/rubytypeformio"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
