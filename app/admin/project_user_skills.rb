ActiveAdmin.register ProjectUserSkill do
  permit_params :project_user_id, :user_skill_id
  actions :new, :create, :edit, :update, :destroy, :index    
  belongs_to :project_user
  index do
    selectable_column
    column :user_skill
    actions
  end
end
