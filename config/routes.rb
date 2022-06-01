Rails.application.routes.draw do
  resources :subtasks
  resources :tasks
  resources :sessions
  resources :users
  get 'sessions/new'
  get 'auth/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # user
  #get   "/users",     to: "users#index"   
  #post  "/users",     to: "users#create"   
  #patch "/users/:id", to: "users#update"

  # auth
  post   "/auth", to: "sessions#create"
  delete "/auth", to: "sessions#destroy"
end
