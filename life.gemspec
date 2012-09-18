# -*- encoding: utf-8 -*-
require File.expand_path('../lib/life/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joel Quenneville"]
  gem.email         = ["joel.quenneville@collegeplus.org"]
  gem.description   = %q{Conway's Game of life in ruby}
  gem.summary       = %q{Conway's Game of life in ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "life"
  gem.require_paths = ["lib"]
  gem.version       = Life::VERSION

  gem.add_development_dependency 'rspec'
end
