# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-clients/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Brett Rudd"]
  gem.email         = ["rudd@adobe.com"]
  gem.description   = %q{OmniAuth clients for PhoneGapBuild.}
  gem.summary       = %q{OmniAuth clients for PhoneGapBuild.}
  gem.homepage      = "https://github.com/nitobi/omniauth-clients"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-clients"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Clients::VERSION

  gem.add_dependency 'omniauth'
  gem.add_dependency 'omniauth-oauth2'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
