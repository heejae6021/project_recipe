class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingred
      t.string :s_count
      t.string :link
      t.string :img_link

      t.timestamps null: false
    end
  end
end
