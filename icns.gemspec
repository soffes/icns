# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'icns/version'

Gem::Specification.new do |spec|
  spec.name          = 'icns'
  spec.version       = Icns::VERSION
  spec.authors       = ['Sam Soffes']
  spec.email         = ['sam@soff.es']
  spec.summary       = 'Read images from Apple Icon Image format (ICNS) files.'
  spec.homepage      = 'https://github.com/soffes/icns'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rubocop', '~> 0.56'
end
