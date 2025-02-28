# frozen_string_literal: true

require_relative "lib/kolabs/version"

Gem::Specification.new do |spec|
  spec.name = "kolabs-cli"
  spec.version = Kolabs::VERSION
  spec.authors = ["Vitor Serigati"]
  spec.email = ["vitor_serigati@hotmail.com"]

  spec.summary = "Ruby CLI tool created for Kolabs to create and manage new rails applications"
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://github.com/vitorserigati/kolabs-cli"
  spec.license = "MIT"
  spec.required_ruby_version = "~> 3.3.1"

  spec.metadata["allowed_push_host"] = "https://github.com/vitorserigati/kolabs-cli"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "fileutils", "~> 1.7.3"
  spec.add_dependency "open3"
  spec.add_dependency "rails", ">= 7.0", "<= 8.0"
  spec.add_dependency "tempfile"
  spec.add_dependency "thor", "~> 1.3"

  spec.add_development_dependency "aruba"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "pry"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
