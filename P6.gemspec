lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "P6/version"
Gem::Specification.new do |spec|
  spec.name          = "P6-alu0101111254"
  spec.version       = P6::VERSION
  spec.authors       = ["Lucas Bodson"]
  spec.email         = ["alu0101111254@ull.edu.es"]

  spec.summary       = %q{Practica 6 de lpp : TDD.}
  spec.description   = %q{Usamos Test Driven Development para generar una clase para almacenar informacion de alimentos y evaluarlas.}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0101111254"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "guard"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "rspec", "~> 3.0"
end
