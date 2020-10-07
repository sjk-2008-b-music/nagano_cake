class AddIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :end_user_id, :integer
  end
end
