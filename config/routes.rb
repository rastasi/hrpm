Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config
  root 'base#index'
  resource :user_skills do
    collection do
      get :export
    end
  end
end
