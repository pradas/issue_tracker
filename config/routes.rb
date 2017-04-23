Rails.application.routes.draw do
  
  resources :issue_watches
  resources :issue_votes
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  resources :issues
  resources :comments
  
  post 'issues/:id/comments', to: 'comments#create'

  root 'issues#index'
end
