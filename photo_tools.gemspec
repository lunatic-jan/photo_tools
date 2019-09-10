# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'photo_tools/version'

Gem::Specification.new do |spec|
  spec.name          = 'photo_tools'
  spec.version       = PhotoTools::VERSION
  spec.authors       = ['Jan Grela']
  spec.email         = ['mail@jangrela.com']

  spec.summary       = 'Utilities for photos'
  spec.description   = 'Utilities for photos - libs and executables'
  spec.homepage      = 'https://github.com/lunatic-jan/photo_tools'
  spec.license       = 'MIT'

  spec.files = Dir['{bin,lib}/**/*', 'LICENSE', 'README.md']
  spec.test_files = Dir['spec/**/*']
  spec.executables = ['photo']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.70.0'

  spec.add_runtime_dependency 'commander', '~> 4.4'
  spec.add_runtime_dependency 'mini_magick', '~> 4.9'
end
