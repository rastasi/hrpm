class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  def name
    "#{self.user.name} - #{self.skill.name} (#{self.level})"
  end
end
