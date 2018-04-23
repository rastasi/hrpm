ActiveAdmin.register UserSkill do
  permit_params :skill_id, :user_id, :level
  actions :new, :create, :edit, :update, :destroy, :index  
  belongs_to :user

  index do
    selectable_column
    column :skill
    column :level
    actions
  end
end
