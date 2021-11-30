class RemoveDescriptionFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :description, :text
  end
end
