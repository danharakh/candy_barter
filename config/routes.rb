Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "organizations#index"
  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  # Routes for the Line_item resource:
  # CREATE
  get "/line_items/new", :controller => "line_items", :action => "new"
  post "/create_line_item", :controller => "line_items", :action => "create"

  # READ
  get "/line_items", :controller => "line_items", :action => "index"
  get "/line_items/:id", :controller => "line_items", :action => "show"

  # UPDATE
  get "/line_items/:id/edit", :controller => "line_items", :action => "edit"
  post "/update_line_item/:id", :controller => "line_items", :action => "update"

  # DELETE
  get "/delete_line_item/:id", :controller => "line_items", :action => "destroy"
  #------------------------------

  # Routes for the Proposed_trade resource:
  # CREATE
  get "/proposed_trades/new", :controller => "proposed_trades", :action => "new"
  post "/create_proposed_trade", :controller => "proposed_trades", :action => "create"

  # READ
  get "/proposed_trades", :controller => "proposed_trades", :action => "index"
  get "/proposed_trades/:id", :controller => "proposed_trades", :action => "show"

  # UPDATE
  get "/proposed_trades/:id/edit", :controller => "proposed_trades", :action => "edit"
  post "/update_proposed_trade/:id", :controller => "proposed_trades", :action => "update"

  # DELETE
  get "/delete_proposed_trade/:id", :controller => "proposed_trades", :action => "destroy"
  #------------------------------

  # Routes for the Inventory resource:
  # CREATE
  get "/inventories/new", :controller => "inventories", :action => "new"
  post "/create_inventory", :controller => "inventories", :action => "create"

  # READ
  get "/inventories", :controller => "inventories", :action => "index"
  get "/inventories/:id", :controller => "inventories", :action => "show"

  # UPDATE
  get "/inventories/:id/edit", :controller => "inventories", :action => "edit"
  post "/update_inventory/:id", :controller => "inventories", :action => "update"

  # DELETE
  get "/delete_inventory/:id", :controller => "inventories", :action => "destroy"
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"

  # READ
  get "/items", :controller => "items", :action => "index"
  get "/items/:id", :controller => "items", :action => "show"

  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"

  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------

  # Routes for the Membership resource:
  # CREATE
  get "/memberships/new", :controller => "memberships", :action => "new"
  post "/create_membership", :controller => "memberships", :action => "create"

  # READ
  get "/memberships", :controller => "memberships", :action => "index"
  get "/memberships/:id", :controller => "memberships", :action => "show"

  # UPDATE
  get "/memberships/:id/edit", :controller => "memberships", :action => "edit"
  post "/update_membership/:id", :controller => "memberships", :action => "update"

  # DELETE
  get "/delete_membership/:id", :controller => "memberships", :action => "destroy"
  #------------------------------

  # Routes for the Organization resource:
  # CREATE
  get "/organizations/new", :controller => "organizations", :action => "new"
  post "/create_organization", :controller => "organizations", :action => "create"

  # READ
  get "/organizations", :controller => "organizations", :action => "index"
  get "/organizations/:id", :controller => "organizations", :action => "show"

  # UPDATE
  get "/organizations/:id/edit", :controller => "organizations", :action => "edit"
  post "/update_organization/:id", :controller => "organizations", :action => "update"

  # DELETE
  get "/delete_organization/:id", :controller => "organizations", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
