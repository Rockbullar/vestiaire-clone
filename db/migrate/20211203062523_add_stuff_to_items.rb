class AddStuffToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :location, :string
    add_column :items, :condition, :string
  end
end
