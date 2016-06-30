class Event
  include Hanami::Entity

  attributes :name, :version, :actor, :created_at, :data
end
