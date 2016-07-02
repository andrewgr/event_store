class Event
  include Hanami::Entity
  include Hanami::Validations

  attributes :name, :version, :actor, :created_at, :data

  validations do
    required(:name)       { filled? }
    required(:version)    { filled? }
    required(:actor)      { filled? }
    required(:created_at) { filled? }
    required(:data)       { filled? }
  end
end
