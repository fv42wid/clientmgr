class AddUserIdToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :user_id, :integer
  end
end
