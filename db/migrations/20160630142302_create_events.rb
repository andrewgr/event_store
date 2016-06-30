Hanami::Model.migration do
  change do
    create_table :events do
      primary_key :id
      column :name,       String,   null: false
      column :version,    String,   null: false
      column :actor,      String,   null: false
      column :data,       'jsonb',  null: false
      column :created_at, DateTime, null: false
    end
  end
end
