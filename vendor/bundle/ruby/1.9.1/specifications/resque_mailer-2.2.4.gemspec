# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "resque_mailer"
  s.version = "2.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Plante"]
  s.date = "2013-05-25"
  s.description = "Rails plugin for sending asynchronous email with ActionMailer and Resque."
  s.email = ["nap@zerosum.org"]
  s.extra_rdoc_files = ["LICENSE", "CHANGELOG.md", "README.md"]
  s.files = ["LICENSE", "CHANGELOG.md", "README.md"]
  s.homepage = "http://github.com/zapnap/resque_mailer"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Rails plugin for sending asynchronous email with ActionMailer and Resque."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionmailer>, [">= 3.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
      s.add_development_dependency(%q<yard>, [">= 0.6.0"])
    else
      s.add_dependency(%q<actionmailer>, [">= 3.0"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
      s.add_dependency(%q<yard>, [">= 0.6.0"])
    end
  else
    s.add_dependency(%q<actionmailer>, [">= 3.0"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
    s.add_dependency(%q<yard>, [">= 0.6.0"])
  end
end
