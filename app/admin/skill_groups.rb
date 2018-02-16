ActiveAdmin.register SkillGroup do
  menu parent: 'Misc'
  permit_params :name
  actions :new, :create, :edit, :update, :delete, :index
  config.filters = false  
  index do
    selectable_column
    column :name
    column :description
    actions
  end
end
