class AddUserIdToAwsaccount < ActiveRecord::Migration[5.1]
  def change
    add_column :awsaccounts, :user_id, :integer
  end
end
