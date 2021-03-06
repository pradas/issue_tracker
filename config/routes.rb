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
  get '/api/users', to: 'api_users#index'
  get '/api/users/:user_id', to: 'api_users#show'
  post '/api/sessions', to: 'api_sessions#login'

  #Issues management
  get '/api/issues', to: 'api_issues#index'
  post '/api/issues', to: 'api_issues#create'
  get '/api/issues/:issue_id', to: 'api_issues#show'
  put '/api/issues/:issue_id', to: 'api_issues#update'
  delete '/api/issues/:issue_id', to: 'api_issues#destroy'
  post '/api/issues/:issue_id/votes', to: 'api_votes#create'
  delete '/api/issues/:issue_id/votes', to: 'api_votes#destroy'
  post '/api/issues/:issue_id/watchers', to: 'api_watchers#create'
  delete '/api/issues/:issue_id/watchers', to: 'api_watchers#destroy'
  get '/api/issues/:issue_id/comments', to: 'api_comments#index'
  post '/api/issues/:issue_id/comments', to: 'api_comments#create'
  get '/api/issues/:issue_id/comments/:comment_id', to: 'api_comments#show'
  put '/api/issues/:issue_id/comments/:comment_id', to: 'api_comments#update'
  delete '/api/issues/:issue_id/comments/:comment_id', to: 'api_comments#destroy'
  get '/api/issues/:issue_id/attachments/', to: 'api_resumes#index'
  post '/api/issues/:issue_id/attachments/', to: 'api_resumes#create'
  get '/api/issues/:issue_id/attachments/:attachment_id', to: 'api_resumes#show'
  delete '/api/issues/:issue_id/attachments/:attachment_id', to: 'api_resumes#destroy'

end
