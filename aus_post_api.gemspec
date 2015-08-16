Gem::Specification.new do |gem|
  gem.authors       = ["JaredShay"]
  gem.email         = ["jared.shay@gmail.com"]
  gem.description   = %q{Wrapper for Australia Post's developer API}
  gem.summary       = %q{Wrapper for Australia Post's developer API}
  gem.homepage      = "https://github.com/jaredshay/aus_post_api"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- spec/*`.split("\n")
  gem.name          = "aus_post_api"
  gem.require_paths = ["lib"]
  gem.version       = '1.0.0'
  gem.license       = "MIT"
end
