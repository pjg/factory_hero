# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory_hero/version'

Gem::Specification.new do |spec|
  spec.name          = "factory_hero"
  spec.version       = FactoryHero::VERSION
  spec.licenses         = ['MIT']
  spec.authors       = ["Paweł Gościcki"]
  spec.email         = "pawel.goscicki@gmail.com"

  spec.summary       = %q{FactoryHero for creating factories}
  spec.description   = %q{FactoryGirl replacement (proof of concept)}
  spec.homepage      = "https://github.com/pjg/factory_hero"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
end
