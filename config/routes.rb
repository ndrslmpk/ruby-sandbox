Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "articles#index"

  resources :articles do

    # NESTED RESOURCES 
    # articles inside comments and creates a hierarchical structure  
    # This will automatically generate a routing dependency that will require
    # an article within a route like this:
    # ../articles/:articles_id/comments/....
    # ../articles/:articles_id/comments/
    # ../articles/:articles_id/comments/new
    # ../articles/:articles_id/comments/id
    # ../articles/:articles_id/comments/:id/edit

    resources :comments
  end


  get "/articles/topfive", to: "articles#topfive"
  get "/articles/search/:id", to: "articles#show" # :id is a route parameter
  get "/articles/first", to: "articles#first"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
