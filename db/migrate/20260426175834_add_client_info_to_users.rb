class AddClientInfoToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :age, :integer
    add_column :users, :sex, :integer
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :profession, :string
    add_column :users, :work_routine, :string
    add_column :users, :has_complete_info, :boolean, default: false, null: false
  end
end
