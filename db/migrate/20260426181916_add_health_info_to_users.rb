class AddHealthInfoToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :current_weight, :float
    add_column :users, :height, :float
    add_column :users, :abdominal_circumference, :float
    add_column :users, :measured_with_tape, :boolean, default: false
    add_column :users, :measurement_notes, :text
    add_column :users, :main_goal, :integer
    add_column :users, :main_discomfort, :text
  end
end
