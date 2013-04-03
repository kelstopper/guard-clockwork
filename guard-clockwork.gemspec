# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/clockwork/version'

Gem::Specification.new do |spec|
  spec.name          = 'guard-clockwork'
  spec.version       = Guard::ClockworkVersion::VERSION
  spec.authors       = ['Moonsik Kang']
  spec.email         = %w(byblue@gmail.com)
  spec.description   = %q{guard gem for clockwork}
  spec.summary       = %q{Guard::Clockwork automatically starts/stops/restarts Clockwork}
  spec.homepage      = 'https://github.com/deepblue/guard-clockwork'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_dependency 'guard', '>= 1.1'
  spec.add_dependency 'clockwork'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
