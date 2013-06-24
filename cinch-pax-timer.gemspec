# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cinch/plugins/pax-timer/version'

Gem::Specification.new do |gem|
  gem.name          = "cinch-pax-timer"
  gem.version       = Cinch::Plugins::PaxTimer::VERSION
  gem.authors       = ["Brian Haberer"]
  gem.email         = ["bhaberer@gmail.com"]
  gem.description   = %q{Cinch plugin that allows users to see the relative time till the various PAX events}
  gem.summary       = %q{Cinch Plugin that acts as a PAX countdown}
  gem.homepage      = "https://github.com/bhaberer/cinch-pax-timer"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency  'cinch-cooldown',     '>= 1.0.0'
  gem.add_dependency  'cinch-toolbox',      '~> 1.0.1'

end
