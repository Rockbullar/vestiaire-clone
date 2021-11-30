class AddAttributesToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :size, :string
    add_column :items, :categories, :text
  end
end
