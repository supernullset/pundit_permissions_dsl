# -*- encoding: utf-8 -*-

require File.expand_path('../lib/pundit_permissions_dsl/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "pundit_permissions_dsl"
  gem.version       = PunditPermissionsDSL::VERSION
  gem.summary       = %q{TODO: Summary}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = %w(supernullset elskwid phlipper)
  gem.email         = "no.email"
  gem.homepage      = "https://github.com/supernullset/pundit_permissions_dsl#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rdoc', '~> 3.0'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'rails', '~> 4.0.0'

  gem.add_runtime_dependency 'pundit', '~> 0.2.1'
end
