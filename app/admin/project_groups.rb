ActiveAdmin.register ProjectGroup do
  menu parent: 'Projects'
  permit_params :name, :description
  
end
