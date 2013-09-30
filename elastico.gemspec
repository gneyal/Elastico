# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elastico/version'

Gem::Specification.new do |gem|
  gem.name          = "elastico"
  gem.version       = Elastico::VERSION
  gem.authors       = ["Eyal Goren"]
  gem.email         = ["gneyal+elastico@gmail.com"]
  gem.description   = %q{A general way to use elasticsearch}
  gem.summary       = %q{Elastico presents a simple way to work with elasticsearch. 1. Define your setup. 2. Define your search query. 3. Search.}
  gem.homepage      = "https://github.com/gneyal/Elastico"
  gem.license       = 'MIT'
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency "spawnling", "~> 2.1.1"
  gem.add_development_dependency "rest-client"
end
