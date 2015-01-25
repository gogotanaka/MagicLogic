($LOAD_PATH << File.expand_path("../lib", __FILE__)).uniq!
require 'magic_logic/version'

Gem::Specification.new do |spec|
  spec.name          = "magic_logic"
  spec.version       = MagicLogic::VERSION
  spec.authors       = ["gogotanaka"]
  spec.email         = ["mail@tanakakazuki.com"]
  spec.summary       = %q{ Magic logic }
  spec.description   = %q{ Magic logic }
  spec.homepage      = "https://github.com/Hilbert-lang/magic_logic"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*', 'bin/*', 'test/**/*']
  spec.executables   = ['magic_logic']
  spec.test_files    = Dir["test/**/*_test.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
