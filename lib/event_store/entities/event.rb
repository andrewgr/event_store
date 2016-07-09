require 'hanami/validations'
require_relative '../../ext/pg_jsonb'

class Event
  include Hanami::Entity
  include Hanami::Validations

  attribute :name,       presence: true
  attribute :version,    presence: true
  attribute :actor,      presence: true
  attribute :created_at, presence: true, type: DateTime
  # TODO: remove comment
  attribute :data,       presence: true#, type: PGJsonb
end
