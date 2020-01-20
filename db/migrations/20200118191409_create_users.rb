Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :name, String
      column :email, String, null: false, unique: true
      column :encrypted_password, String, null: false
      column :confirmation_token, String
      column :confirmed, TrueClass

      foreign_key :account_id, :accounts, on_delete: :cascade

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :email, unique: true
    end
  end
end
