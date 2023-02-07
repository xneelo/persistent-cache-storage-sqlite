# Persistent::StorageSQLite

[![Gem Version](https://badge.fury.io/rb/persistent-cache-storage-sqlite.svg)](https://badge.fury.io/rb/persistent-cache-storage-sqlite)
[![Build Status](https://github.com/xneelo/persistent-cache-storage-sqlite/actions/workflows/test.yml/badge.svg)](https://github.com/xneelo/persistent-cache-storage-sqlite/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/xneelo/persistent-cache-storage-sqlite/badge.svg?branch=master)](https://coveralls.io/github/xneelo/persistent-cache-storage-sqlite?branch=master)

This gem provides a SQLite storage back-end to Persistent::Cache. Please see https://rubygems.org/gems/persistent-cache.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'persistent-cache-storage-sqlite'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install persistent-cache-storage-sqlite

## Usage

Updates to the cache are written to the sqlite3 storage, with SQL driver timeout set to 30 seconds.

Tell Persistent::Cache to use this provider so:

    require 'persistent-cache/storage_sqlite'
    require 'persistent-cache'

    freshness = nil # forever or freshness in seconds
    cache = Persistent::Cache.new('sqlite-cache-name', freshness, Persistent::Cache::STORAGE_SQLITE)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/evangraan/persistent-cache-storage-sqlite. This gem was sponsored by Hetzner (Pty) Ltd - http://hetzner.co.za

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

