# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pathfinder/version"

Gem::Specification.new do |s|
  s.name        = "pathfinder"
  s.version     = Pathfinder::VERSION
  s.authors     = ["Marco V. Aguilar Soto"]
  s.email       = ["aguilarsoto@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{ZenCash test Nasa Pathfinder solution}
  s.description = %q{ZenCash test Nasa Pathfinder solution}

  s.rubyforge_project = "pathfinder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
