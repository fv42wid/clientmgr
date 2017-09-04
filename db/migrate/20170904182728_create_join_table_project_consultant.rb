class CreateJoinTableProjectConsultant < ActiveRecord::Migration[5.1]
  def change
    create_join_table :projects, :consultants do |t|
      # t.index [:project_id, :consultant_id]
      # t.index [:consultant_id, :project_id]
    end
  end
end
