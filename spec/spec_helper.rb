$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'persistent-cache/storage_sqlite'

def get_database_name
  path = Tempfile.new("persistent-cache-spec-testdb").path
  FileUtils.rm_f(path)
  path
end