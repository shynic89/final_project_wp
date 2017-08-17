Rails.application.routes.draw do
  # Routes for the Firm resource:
  # CREATE
  get "/firms/new", :controller => "firms", :action => "new"
  post "/create_firm", :controller => "firms", :action => "create"

  # READ
  get "/firms", :controller => "firms", :action => "index"
  get "/firms/:id", :controller => "firms", :action => "show"

  # UPDATE
  get "/firms/:id/edit", :controller => "firms", :action => "edit"
  post "/update_firm/:id", :controller => "firms", :action => "update"

  # DELETE
  get "/delete_firm/:id", :controller => "firms", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
