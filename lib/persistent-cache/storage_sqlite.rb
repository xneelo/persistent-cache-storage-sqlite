require 'persistent-cache/storage_api'
require 'persistent-cache/version'
require "sqlite3"
require "base64"
require "eh/eh"

module Persistent
  class StorageSQLite < Persistent::Cache::StorageApi::API
    DB_TABLE = "key_value" unless defined? DB_TABLE; DB_TABLE.freeze
    DB_TIMEOUT = 30000 unless defined? DB_TIMEOUT; DB_TIMEOUT.freeze

    attr_accessor :storage_details
    attr_accessor :storage_handler

    def initialize(storage_details)
      raise ArgumentError.new("Storage details not provided") if storage_details.nil? or storage_details == ""
      @storage_details = storage_details
      @storage_handler = connect_to_database
      @storage_handler.busy_timeout = 30000
    end

    def save_key_value_pair(key, value, timestamp = nil)
      delete_entry(key)
      time_entry = timestamp.nil? ? Time.now.to_s : timestamp.to_s
      EH::retry!(:args => [serialize(key), serialize(value), time_entry]) do
        @storage_handler.execute("INSERT INTO #{DB_TABLE} (key, value, timestamp) VALUES(?, ?, ?)",serialize(key), serialize(value), time_entry)
      end
    end

    def lookup_key(key)
      EH::retry!(:args => [serialize(key)]) do
        result = @storage_handler.execute("SELECT value, timestamp FROM #{DB_TABLE} WHERE key=?", serialize(key))
        !result.nil? && !result.empty? ? [deserialize(result[0][0]), result[0][1]] : nil
      end
    end

    def delete_entry(key)
      EH::retry!(:args => [serialize(key)]) do
        @storage_handler.execute("DELETE FROM #{DB_TABLE} WHERE key=?", serialize(key))
      end
    end

    def size
      EH::retry!(:args => []) do
        @storage_handler.execute("SELECT value FROM #{DB_TABLE}").size
      end
    end

    def keys
      EH::retry!(:args => []) do
        @storage_handler.execute("SELECT key FROM #{DB_TABLE}").collect { |k| deserialize(k[0]) }
      end
    end

    def clear
      EH::retry!(:args => []) do
        @storage_handler.execute("DELETE FROM #{DB_TABLE}")
      end
    end

    private

    def serialize(data)
      Base64.encode64(Marshal.dump(data))
    end

    def deserialize(data)
      Marshal.load(Base64.decode64(data))

      rescue TypeError => ex
        Marshal.load(data)
    end

    def connect_to_database
      File.exists?(@storage_details) ? open_database : create_database
    end

    def open_database
      EH::retry!(:args => []) do
        SQLite3::Database.open(@storage_details)
      end
    end

    def create_database
      EH::retry!(:args => []) do
        @storage_handler = SQLite3::Database.new(@storage_details)
        create_table
      end
      @storage_handler
    end

    def create_table
      EH::retry!(:args => []) do
        @storage_handler.execute("CREATE TABLE #{DB_TABLE}(key TEXT PRIMARY KEY, value TEXT, timestamp TEXT)")
      end
      @storage_handler
    end
  end
end
