class CreateJoinTableExpertiseConsultant < ActiveRecord::Migration[5.1]
  def change
    create_join_table :expertises, :consultants do |t|
      # t.index [:expertise_id, :consultant_id]
      # t.index [:consultant_id, :expertise_id]
    end
  end
end
