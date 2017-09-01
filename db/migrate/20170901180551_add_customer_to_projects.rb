class AddCustomerToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :customer_id, :integer
  end
end
