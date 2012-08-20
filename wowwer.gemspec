# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wowwer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Elliott Pogue", "Maddie Phillips"]
  gem.email         = ["epogue@gmail.com", "madphillips@gmail.com"]
  gem.description   = %q{A ruby wrapper for the Battle.net World of Warcraft API}
  gem.summary       = %q{WoW API wrapper}
  gem.homepage      = "https://github.com/epogue/wowwer"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "wowwer"
  gem.require_paths = ["lib"]
  gem.version       = Wowwer::Version

  gem.add_dependency 'multi_json', '~> 1.3.6'
  gem.add_dependency 'faraday', '~> 0.8.4'
  gem.add_dependency 'hashie', '~> 1.2.0'
  gem.add_development_dependency 'json'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'fakeweb'
end