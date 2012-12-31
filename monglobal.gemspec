# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "monglobal/version"

Gem::Specification.new do |s|
  s.name        = "monglobal"
  s.version     = Monglobal::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Wylie Thomas"]
  s.email       = ["wylie@wyliethomas.com"]
  s.homepage    = "http://www.wyliethomas.com/blog/projects/monglobal"
  s.summary     = %q{Translates models in Rails for MongoDB}
  s.description = %q{Translates models in Rails for MongoDB}

  s.rubyforge_project = "monglobal"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

end
