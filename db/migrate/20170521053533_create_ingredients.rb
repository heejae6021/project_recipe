class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.text :s_ingred
      t.string :s_category
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
