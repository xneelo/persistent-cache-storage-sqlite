require 'simplecov'
require 'simplecov-lcov'

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
SimpleCov.start do
  add_filter '/spec/'
end

require 'persistent-cache/storage_sqlite'
require 'tempfile'

def get_database_name
  path = Tempfile.new("persistent-cache-spec-testdb").path
  FileUtils.rm_f(path)
  path
end
