# Persistent::StorageSQLite

[![Gem Version](https://badge.fury.io/rb/persistent-cache-storage-sqlite.png)](https://badge.fury.io/rb/persistent-cache-storage-sqlite)
[![Build Status](https://travis-ci.org/evangraan/persistent-cache-storage-sqlite.svg?branch=master)](https://travis-ci.org/evangraan/persistent-cache-storage-sqlite)
[![Coverage Status](https://coveralls.io/repos/github/evangraan/persistent-cache-storage-sqlite/badge.svg?branch=master)](https://coveralls.io/github/evangraan/persistent-cache-storage-sqlite?branch=master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/73ee400089c54d80afb0a6125f7235c7)](https://www.codacy.com/app/ernst-van-graan/persistent-cache-storage-sqlite?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=evangraan/persistent-cache-storage-sqlite&amp;utm_campaign=Badge_Grade)

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

