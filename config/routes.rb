Rails.application.routes.draw do
  resources :issues
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'issues#index'
end
