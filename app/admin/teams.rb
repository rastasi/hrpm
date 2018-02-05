ActiveAdmin.register Team do
  menu parent: 'Misc'
  permit_params :name, :description
  index do
    selectable_column
    column :name
    actions
  end
end
