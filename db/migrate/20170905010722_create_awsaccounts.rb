class CreateAwsaccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :awsaccounts do |t|
      t.integer :project_id
      t.text :account_id
      t.float :estimated_spend

      t.timestamps
    end
  end
end
