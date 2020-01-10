Hanami::Model.migration do
  change do
    alter_table :projects do
      add_foreign_key :account_id, :accounts, on_delete: :cascade, null: false, foreign_key_constraint_name: :projects_account_id_fkey
    end
  end
end
