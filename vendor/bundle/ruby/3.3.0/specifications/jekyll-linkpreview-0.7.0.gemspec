# -*- encoding: utf-8 -*-
# stub: jekyll-linkpreview 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-linkpreview".freeze
  s.version = "0.7.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yusuke Nishioka".freeze]
  s.date = "2023-05-05"
  s.email = ["yusuke.nishioka.0713@gmail.com".freeze]
  s.homepage = "https://github.com/ysk24ok/jekyll-linkpreview".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Jekyll tag plugin to generate link preview".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<jekyll>.freeze, [">= 3.5".freeze, "< 5.0".freeze])
  s.add_runtime_dependency(%q<metainspector>.freeze, ["~> 5.9".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 12.3.3".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0".freeze])
  s.add_development_dependency(%q<rspec-parameterized>.freeze, ["~> 0.5.2".freeze])
  s.add_development_dependency(%q<wwtd>.freeze, ["~> 1.4.1".freeze])
end
