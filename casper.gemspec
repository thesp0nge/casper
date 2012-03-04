# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "casper/version"

Gem::Specification.new do |s|
  s.name        = "casper"
  s.version     = Casper::Version.version
  s.authors     = ["Paolo Perego"]
  s.email       = ["thesp0nge@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A transparent HTTP proxy}
  s.description = %q{A transparent HTTP proxy}

  s.rubyforge_project = "casper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

  s.add_dependency  "rainbow"
  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
