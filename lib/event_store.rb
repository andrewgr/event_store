require 'hanami/model'
require_relative './ext/pg_jsonb'

Dir["#{ __dir__ }/event_store/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/event_store_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/event_store_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/event_store_development'
  #    adapter type: :sql, uri: 'mysql://localhost/event_store_development'
  #
  adapter type: :sql, uri: ENV['EVENT_STORE_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :events do
      entity     Event
      repository EventRepository

      attribute :id,         Integer
      attribute :name,       String
      attribute :version,    String
      attribute :actor,      String
      attribute :data,       PGJsonb
      attribute :created_at, DateTime
    end
  end
end.load!
