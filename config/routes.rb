Rails.application.routes.draw do
  resources :subtasks
  #resources :tasks
  #resources :sessions
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # auth
  post   "/auth", to: "sessions#create"
  delete "/auth", to: "sessions#destroy"
  
  # task
  post   "/tasks", to: "tasks#create"
  patch  "/tasks/:id", to: "tasks#update"
end
