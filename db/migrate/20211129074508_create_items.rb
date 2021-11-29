class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :brand
      t.boolean :is_sold

      t.timestamps
    end
  end
end
