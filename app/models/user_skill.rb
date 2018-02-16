class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  validates :skill, presence: true, uniqueness: { scope: :user }
  validates :user, presence: true
  validates :level, presence: true

  def name
    "#{self.user.name} - #{self.skill.name} (#{self.level})"
  end
end
