class SkillGroup < ApplicationRecord
  has_many :skills
  validates :name, uniqueness: true, presence: true  
end
