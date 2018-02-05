ActiveAdmin.register Team do
  menu parent: 'People'
  permit_params :name, :description

end
