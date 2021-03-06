ActiveAdmin.register Team do
  menu parent: 'Groups'
  permit_params :name, :description
  actions :new, :create, :edit, :update, :destroy, :index  
  config.filters = false
  index do
    selectable_column
    column :name
    actions
  end
end
