class Skill < ApplicationRecord
  belongs_to :skill_group
  has_many :user_skills
end
