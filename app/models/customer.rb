class Customer < ApplicationRecord
  belongs_to :user
  has_many :projects

  validates :name, presence: true, length: {minimum: 3}
  validates :website, presence: true
end
