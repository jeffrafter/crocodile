# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{crocodile}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Rafter"]
  s.date = %q{2009-07-08}
  s.default_executable = %q{crocodile}
  s.email = %q{jeff@baobabhealth.org}
  s.executables = ["crocodile"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/crocodile",
     "crocodile.gemspec",
     "lib/crocodile.rb",
     "test/crocodile_test.rb",
     "test/test_helper.rb",
     "vendor/selenium-server.jar",
     "vendor/selenium-server.jar"
  ]
  s.homepage = %q{http://github.com/jeffrafter/crocodile}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Crocodile is a quick tool for taking screenshots using selenium-client}
  s.test_files = [
    "test/crocodile_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<selenium-client>, ["= 1.2.14"])
    else
      s.add_dependency(%q<selenium-client>, ["= 1.2.14"])
    end
  else
    s.add_dependency(%q<selenium-client>, ["= 1.2.14"])
  end
end
