# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'persistent-cache/version'

Gem::Specification.new do |spec|
  spec.name          = 'persistent-cache-storage-sqlite'
  spec.version       = Persistent::Storage::Sqlite::VERSION
  spec.authors       = ['Hetzner Pty Ltd']
  spec.email         = ['kernels@hetzner.co.za']

  spec.summary       = %q{Provides a SQLite storage back-end to Persistent::Cache}
  spec.description   = %q{Provides a SQLite storage back-end to Persistent::Cache}
  spec.homepage      = 'https://github.com/hetznerZA/persistent-cache-storage-sqlite'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'byebug', '~> 9.0'
  spec.add_dependency 'sqlite3', '~> 1.4'
  spec.add_dependency 'persistent-cache-storage-api', '~> 0.1'
  spec.add_dependency 'eh', '~> 1.0.0'
end
