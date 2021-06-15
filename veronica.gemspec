# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "veronica/version"

Gem::Specification.new do |spec|
  spec.name          = "veronica"
  spec.version       = Veronica::VERSION
  spec.authors       = ["Noah Berman"]
  spec.email         = ["noah@noahberman.org"]

  spec.summary       = %q{A simple hashing gem.}
  spec.description   = %q{Basically just a wrapper around existing hashing/encrypting methods.}
  spec.homepage      = "https://github.com/bermannoah/veronica"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2.10"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.15"
  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_development_dependency "zxcvbn-ruby", "~> 0.1.0"
  spec.add_development_dependency "faker", '~> 2.18.0', '>= 2.18.0'
end
