$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spree_walletone/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spree_walletone"
  s.version     = SpreeWalletone::VERSION
  s.authors     = ["Synesis"]
  s.email       = ["y.synesis@gmail.com"]
  s.homepage    = "http://site.com"
  s.summary     = "Walletone integration."
  s.description = "Walletone integration."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'walletone'

  s.add_development_dependency "sqlite3"
end
