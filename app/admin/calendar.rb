ActiveAdmin.register_page "Calendar" do
  menu priority: 2, parent: 'Misc'
  content do
    para "Calendar"
    render partial: 'calendar'
  end
end