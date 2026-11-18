Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/ping", to: "ping#show"
  post "/ping", to: "ping#create"
  patch "/ping/:id", to: "ping#update"
  get "/ping/:id", to:"ping#path_param"
  delete "/ping/:id", to: "ping#destroy"

end
