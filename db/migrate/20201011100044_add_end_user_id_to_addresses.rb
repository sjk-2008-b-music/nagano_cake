class AddEndUserIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :end_user_id, :integer
  end
end
