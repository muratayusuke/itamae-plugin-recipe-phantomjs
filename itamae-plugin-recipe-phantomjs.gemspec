# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-phantomjs"
  spec.version       = "0.0.1"
  spec.authors       = ["Yusuke Murata"]
  spec.email         = ["info@muratayusuke.com"]
  spec.summary       = %q{Itamae Recipe 'phantomjs'}
  spec.description   = %q{Itamae Recipe 'phantomjs'}
  spec.homepage      = "https://github.com/muratayusuke/itamae-plugin-recipe-phantomjs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "serverspec"
  spec.add_development_dependency "docker-api"
end
