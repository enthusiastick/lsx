class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :preferred_fighting, :string
    add_column :users, :preferred_roles, :string
    add_column :users, :other, :text
  end
end
