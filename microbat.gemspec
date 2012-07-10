$:.push File.expand_path("../lib", __FILE__)

require "microbat/version"

Gem::Specification.new do |s|
  s.name        = "microbat"
  s.version     = Microbat::VERSION
  s.authors     = ["Dan Richert"]
  s.email       = ["drichert@site5.com"]
  s.summary     = "HTTP response time reporter"
  s.description = "Microbats use echolocation"

  s.add_runtime_dependency "rack", "~> 1.4.1"
  s.add_runtime_dependency "puma", "~> 1.4.0"
  s.add_runtime_dependency "trollop", "~> 1.16.2"
  s.add_runtime_dependency "coffee-script", "~> 2.2.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map {|f| File.basename(f) }
  s.require_paths = ["lib"]
end
