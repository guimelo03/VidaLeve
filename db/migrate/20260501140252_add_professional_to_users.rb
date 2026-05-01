class AddProfessionalToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :professional, foreign_key: { to_table: :users }
  end
end
