# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elastico/version'

Gem::Specification.new do |gem|
  gem.name          = "elastico"
  gem.version       = Elastico::VERSION
  gem.authors       = ["Eyal Goren"]
  gem.email         = ["gneyal@gmail.com"]
  gem.description   = %q{A general way to use elasticsearch}
  gem.summary       = %q{Elastico is a simple alternative to work with elasticsearch}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
