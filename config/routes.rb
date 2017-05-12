Rails.application.routes.draw do

  get 'resumes/destroy'

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
  
  post 'issues/:issue_id/votes/', to: 'issue_votes#create'
  post 'issues/:issue_id/watches/', to: 'issue_watches#create'


  root 'issues#index'
  
  ###############
  ## API Calls ##
  ###############
  
  #User management
  get 'api/users', to: 'api_users#index'
  
  post 'api/sessions', to: 'api_sessions#login'
  # delete '/api/sessions', to: ''
  
  # #Issues management
  get '/api/issues', to: 'api_issues#index'
  # post '/api/issues', to: ''
  # get '/api/issues/:issue_id', to: ''
  # put '/api/issues/:issue_id', to: ''
  # delete '/api/issues/:issue_id', to: ''
  # post '/api/issues/:issue_id/votes', to: ''
  # delete '/api/issues/:issue_id/votes/:vote_id', to: ''
  # post '/api/issues/:issue_id/watchers', to: ''
  # delete '/api/issues/:issue_id/watchers/:watcher_id', to: ''
  # get '/api/issues/:issue_id/comments', to: ''
  # post '/api/issues/:issue_id/comments', to: ''
  # get '/api/issues/:issue_id/comments/:comment_id', to: ''
  # put '/api/issues/:issue_id/comments/:comment_id', to: ''
  # delete '/api/issues/:issue_id/comments/:comment_id', to: ''
  # get '/api/issues/:issue_id/attachments/', to: ''
  # post '/api/issues/:issue_id/attachments/', to: ''
  # get '/api/issues/:issue_id/attachments/:attachment_id', to: ''
  # delete '/api/issues/:issue_id/attachments/:attachment_id', to: ''

end
