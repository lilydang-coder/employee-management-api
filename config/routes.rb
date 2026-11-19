Rails.application.routes.draw do

  # Route test Controler
  get "/ping", to: "ping#show"
  post "/ping", to: "ping#create"
  patch "/ping/:id", to: "ping#update"
  get "/ping/:id", to:"ping#path_param"
  delete "/ping/:id", to: "ping#destroy"

  #APIs Department
  namespace :api do
    resources :departments, only: [:create, :index, :update, :destroy, :show]
  end
end
