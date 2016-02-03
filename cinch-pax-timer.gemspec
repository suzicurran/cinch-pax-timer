# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cinch/plugins/pax-timer/version'

Gem::Specification.new do |gem|
  gem.name          = 'cinch-pax-timer'
  gem.version       = Cinch::Plugins::PaxTimer::VERSION
  gem.authors       = ['Brian Haberer']
  gem.email         = ['bhaberer@gmail.com']
  gem.description   = %q(Cinch plugin that allows users to see the relative time till the various PAX events)
  gem.summary       = %q(Cinch Plugin that acts as a PAX countdown)
  gem.homepage      = 'https://github.com/bhaberer/cinch-pax-timer'
  gem.license       = 'MIT'
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(/^bin\//).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(/^(test|spec|features)\//)
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake', '~> 10'
  gem.add_development_dependency 'rspec', '~> 3'
  gem.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  gem.add_development_dependency 'cinch-test', '~> 0.1', '>= 0.1.1'

  gem.add_dependency 'cinch', '~> 2'
  gem.add_dependency 'cinch-cooldown', '~> 1.1', '>= 1.1.7'
  gem.add_dependency 'cinch-toolbox', '~> 1.1'
end
