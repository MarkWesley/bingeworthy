lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bingeworthy/version"

Gem::Specification.new do |spec|
  spec.name          = "bingeworthy"
  spec.version       = Bingeworthy::VERSION
  spec.authors       = ["Mark Stone"]
  spec.email         = ["markwstone85@gmail.com"]

  spec.summary       = %q{Allows the user to find a program to watch on TV}
  spec.description   = %q{This program allows the user to search through a list of television genres to find all shows within that genre. From there the user can find details for any particular show in that genre.}
  spec.homepage      = "http://bingeworthy.com"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://bingeworthy.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://bingeworthy.com"
  spec.metadata["changelog_uri"] = "http://bingeworthy.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "httparty"
end
