class AddPartToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :string, :default => 1
  end
end
