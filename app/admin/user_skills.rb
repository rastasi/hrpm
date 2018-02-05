ActiveAdmin.register UserSkill do
  permit_params :skill_id, :user_id, :level
  belongs_to :user
end
