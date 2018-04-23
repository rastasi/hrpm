ActiveAdmin.register Skill do
  menu priority: 5
  permit_params :name, :skill_group_id
  actions :new, :create, :edit, :update, :destroy, :index  

  index do
    selectable_column
    column :name
    column :skill_group
    actions
  end
end
