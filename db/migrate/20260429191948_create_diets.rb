class CreateDiets < ActiveRecord::Migration[8.1]
  def change
    create_table :diets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
