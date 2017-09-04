class Consultant < ApplicationRecord
  has_and_belongs_to_many :expertises
  has_and_belongs_to_many :projects
  belongs_to :user

end
