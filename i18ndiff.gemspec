# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18ndiff/version'

Gem::Specification.new do |spec|
  spec.name          = "i18ndiff"
  spec.version       = I18ndiff::VERSION
  spec.authors       = ["Chris Herring"]
  spec.email         = ["chris.herring.iphone@gmail.com"]

  spec.summary       = %q{Provides a diff of yaml files}
  spec.description   = %q{Provides a diff of yaml files and outputs the diff in the structure of the files given}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["i18ndiff"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
