# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tamashii/hook/version'

Gem::Specification.new do |spec|
  spec.name          = 'tamashii-hook'
  spec.version       = Tamashii::Hook::VERSION
  spec.authors       = ['蒼時弦也']
  spec.email         = ['elct9620@frost.tw']

  spec.summary       = 'Helprr for create hook/callback'
  spec.description   = 'Helprr for create hook/callback'
  spec.homepage      = 'https://tamashii.io'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.51.0'
end
