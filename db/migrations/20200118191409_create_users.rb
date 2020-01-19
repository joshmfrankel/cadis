Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :name, String, null: false
      column :email, String, null: false, unique: true
      column :encryped_password, String

      foreign_key :account_id, :accounts, on_delete: :cascade, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :email, unique: true
    end
  end
end
