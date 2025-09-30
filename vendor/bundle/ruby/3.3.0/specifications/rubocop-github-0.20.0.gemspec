# -*- encoding: utf-8 -*-
# stub: rubocop-github 0.20.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-github".freeze
  s.version = "0.20.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["GitHub".freeze]
  s.date = "2022-10-28"
  s.description = "Code style checking for GitHub Ruby repositories ".freeze
  s.email = "engineering@github.com".freeze
  s.homepage = "https://github.com/github/rubocop-github".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "RuboCop GitHub".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rubocop>.freeze, [">= 1.37".freeze])
  s.add_runtime_dependency(%q<rubocop-performance>.freeze, [">= 1.15".freeze])
  s.add_runtime_dependency(%q<rubocop-rails>.freeze, [">= 2.17".freeze])
  s.add_development_dependency(%q<actionview>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
end
