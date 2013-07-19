# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "bootstrap-timepicker-rails"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pratik Khadloya"]
  s.date = "2013-04-07"
  s.description = "Gemified https://github.com/jdewit/bootstrap-timepicker"
  s.email = ["tispratik@gmail.com"]
  s.homepage = "https://github.com/jdewit/bootstrap-timepicker"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Gemified https://github.com/jdewit/bootstrap-timepicker"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<railties>, [">= 3.0"])
      s.add_dependency(%q<bundler>, [">= 1.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.0"])
    s.add_dependency(%q<bundler>, [">= 1.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
