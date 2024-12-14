Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new, :create]
  resources :skins, only: [:index, :show, :new, :create]
  resources :bids, only: [:new, :create]

  root to: "skins#index"

  #index page
  get("/",{:controller=>"skins",:action=>"index"})
  get("skins/:id",{:controller=>"skins",:action=>"show"})

  #ruby is super smart and knows create will naturally have to be post
  get("skins/new",{:controller=>"skins",:action=>"new"})
  post("skins/create",{:controller=>"skins",:action=>"create"})
  post("update_skin_description/:path_id",{:controller=>"skins", :action=>"update_description"})

  get("bids/new",{:controller=>"bids",:action=>"new"})
  post("bids/create",{:controller=>"bids",:action=>"create"})

  get "users/:username", to: "users#show", as: "user"
  get("users/new",{:controller=>"users",:action=>"new"})
  post("users/create",{:controller=>"users",:action=>"create"})

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
end
