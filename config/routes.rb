Rails.application.routes.draw do
  
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  resources :issue_watches
  resources :issue_votes
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  resources :issues
  resources :comments
  resources :resumes, only: [:index, :new, :create, :destroy]
  
  post 'issues/:issue_id/comments', to: 'comments#create'
  get 'issues/:issue_id/comments/:comment_id', to: 'comments#destroy'
  patch 'issues/:issue_id/comments/:comment_id', to: 'comments#update'


  root 'issues#index'
end
