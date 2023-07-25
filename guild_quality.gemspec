require_relative 'lib/guild_quality/version'

Gem::Specification.new do |spec|
  spec.name          = "guild_quality"
  spec.version       = GuildQuality::VERSION
  spec.authors       = ["Jiren Patel"]
  spec.email         = ["jiren.p@customerlobby.com"]

  spec.summary       = %q{GuildQuality Api client}
  spec.description   = %q{GuildQuality Api client}
  spec.homepage      = "https://github.com/customerlobby/guild_qaulity"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/customerlobby"
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'faraday', '>= 0.9.2'
  spec.add_runtime_dependency 'faraday_middleware', '>= 1.1'
  spec.add_runtime_dependency 'json', '>= 1.8.6'
end
