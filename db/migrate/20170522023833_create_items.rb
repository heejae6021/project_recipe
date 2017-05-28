class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :ss_ingred
      t.string :ss_category

      t.timestamps null: false
    end
  end
end
