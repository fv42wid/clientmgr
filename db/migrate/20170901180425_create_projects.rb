class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :industry
      t.datetime :engagement_date
      t.integer :engagement_duration
      t.string :country
      t.text :business_problem
      t.text :drivers
      t.text :outcome
      t.text :solution
      t.text :solution_explanation
      t.text :people_resource
      t.text :contacts
      t.text :links
      t.text :metrics

      t.timestamps
    end
  end
end
