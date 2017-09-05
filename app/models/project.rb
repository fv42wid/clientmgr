class Project < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_and_belongs_to_many :consultants
  has_many :awsaccounts
end
