# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/playship/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-playship'
  spec.version       = Fastlane::Playship::VERSION
  spec.author        = %q{Helmut Januschka}
  spec.email         = %q{h.januschka@krone.at}

  spec.summary       = %q{Interact with Google Play Api}
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-playship"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  # spec.add_dependency 'your-dependency', '~> 1.0.0'
  # spec.add_dependency 'google-api-client', '~> 0.9.2' # Google API Client to access Play Publishing API
  spec.add_dependency 'google-api-client', '>= 0.36.4' # Google API Client to access Play Publishing API
  
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 2.14.2'
end
