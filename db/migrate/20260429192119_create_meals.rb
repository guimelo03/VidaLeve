class CreateMeals < ActiveRecord::Migration[8.1]
  def change
    create_table :meals do |t|
      t.references :diet, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
