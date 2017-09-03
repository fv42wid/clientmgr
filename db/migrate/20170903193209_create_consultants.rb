class CreateConsultants < ActiveRecord::Migration[5.1]
  def change
    create_table :consultants do |t|
      t.string :name
      t.string :title
      t.text :background

      t.timestamps
    end
  end
end
