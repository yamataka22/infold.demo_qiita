class RemoveProductFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :product, null: false, foreign_key: true
    remove_column :orders, :amount, :integer
  end
end
