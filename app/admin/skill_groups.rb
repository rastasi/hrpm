ActiveAdmin.register SkillGroup do
  menu parent: 'Groups'
  permit_params :name
  actions :new, :create, :edit, :update, :destroy, :index
  config.filters = false  
  index do
    selectable_column
    column :name
    column :description
    actions
  end
end
