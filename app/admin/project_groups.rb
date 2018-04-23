ActiveAdmin.register ProjectGroup do
  menu parent: 'Misc'
  permit_params :name, :description
  actions :new, :create, :edit, :update, :destroy, :index
  config.filters = false  
  index do
    selectable_column
    column :name
    column :description    
    actions
  end
end
