Rails.application.routes.draw do

  get 'resumes/destroy'

  resources :issue_watches
  resources :issue_votes
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  resources :issues
  resources :resumes, only: [:destroy]
  
  post 'issues/:issue_id/comments', to: 'comments#create'
  get 'issues/:issue_id/comments/:comment_id', to: 'comments#destroy'
  patch 'issues/:issue_id/comments/:comment_id', to: 'comments#update'
  
  post 'issues/:issue_id/attachments', to: 'resumes#create'
  #delete 'issues/:issue:id/attachments/:attachment_id', to: 'resumes#destroy'


  root 'issues#index'
end
