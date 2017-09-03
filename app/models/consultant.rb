class Consultant < ApplicationRecord
  has_and_belongs_to_many :expertises
  belongs_to :user

end
