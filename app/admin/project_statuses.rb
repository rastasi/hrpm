ActiveAdmin.register ProjectStatus do
  menu parent: 'Misc'
  permit_params :name
  actions :new, :create, :edit, :update, :destroy, :index
  config.filters = false  
  index do
    selectable_column
    column :name
    column :color
    actions
  end
end
