class Team < ApplicationRecord
  has_many :users
  validates :name, uniqueness: true, presence: true  
end
