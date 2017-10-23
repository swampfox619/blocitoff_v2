class AddOrderToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :order, :integer
  end
end
