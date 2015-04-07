Rails.application.routes.draw do
  
  root 'static_pages#index'
  

  
  get    'newUser'  => 'users#new'
  post   'newUser'  => 'users#create'
  
  get 'reassign' => 'reassigner#new'
  post 'reassign' => 'reassigner#create'
  
  get 'add_db' => 'add_db#new'
  post 'add_db' => 'add_db#create'
  
  get 'edit' => 'users#edit'
  post 'edit' => 'users#update'
  
  get 'answerer' => 'answer#new'
  post 'answerer' => 'answer#create'
  
  get    'join'   => 'joiner#new'
  post   'join'   => 'joiner#create'
  
  get    'create' => 'teams#new'
  post   'create' => 'teams#create'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  
  delete 'logout'  => 'sessions#destroy'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :relationships,       only: [:create, :destroy]
  
  resources :questions
  resources :problems
  resources :team_member
  resources :teams
  resources :users
end
