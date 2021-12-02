class ChangeIsSoldToDefaultfalse < ActiveRecord::Migration[6.1]
  def change
    change_column_default :items, :is_sold, false
  end
end
