Rails.application.routes.draw do
  devise_for :users
  root to: 'admin/dashboard#index'

  namespace :admin do
    resources :protocols
    resources :users
    resources :dashboards, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
