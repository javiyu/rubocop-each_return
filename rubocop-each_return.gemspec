# frozen_string_literal: true

require_relative "lib/rubocop/each_return/version"

Gem::Specification.new do |spec|
  spec.name = "rubocop-each_return"
  spec.version = RuboCop::EachReturn::VERSION
  spec.authors = ["Javier Jimenez"]
  spec.email = ["javier@spacebay.net"]

  spec.summary = "Rubocop extension to avoid assigning of the result of calling array.each to a variable"
  spec.homepage = "https://github.com/javiyu/rubocop-each_return"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rubocop'

  spec.add_development_dependency 'pry'
end

