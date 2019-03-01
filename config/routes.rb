Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "admin/index"

  root to: "home#index"
  get "/.well-known/acme-challenge/:id" => "home#letsencrypt"
  get "/all_locations", to: "locations#all_locations"
  get "/connect_groups/approve", to: "connect_groups#not_approved_index"
  get "/register", to: "connect_groups#new"
  get "/events/revelstoke", to: "events#revelstoke"
  get "/events/kelowna", to: "events#kelowna"
  get "new", to: "home#new"
  resources :connect_groups, :podcasts, :event_types, :events, :messages
  resources :contributions, only: [:new, :create, :index]

  mount Shrine.presign_endpoint(:cache) => "/presign"

  get "app_giving", to: "contributions#new_app"
  get "admin", to: "home#admin"
  get "believe", to: "home#believe"
  get "connect", to: "connect_groups#index"
  get "connection", to: "home#connection"
  get "expect", to: "home#expect"
  get "give", to: "contributions#new"
  get "kids", to: "home#kids"
  get "media", to: "home#media"
  get "nextstep", to: "home#nextstep"
  get "pastors", to: "home#pastors"
  get "vernon", to: "home#vernon"
  get "team", to: "home#pastors"
  get "verse_of_the_day", to: "home#verse_of_the_day"
  get "/team", to: redirect("/pastors")
  get "/vision", to: redirect("believe")
  get "/giving", to: redirect("give")
  get "/feeds/revelstoke", to: "podcasts#revelstoke", defaults: {format: "xml"}
  get "/feeds/kelowna", to: "podcasts#kelowna", defaults: {format: "xml"}
  get "/admin/events", to: "events#admin"

  get "/ajax_load_dashboard", to: "home#ajax_load_dashboard"
  get "/ajax_load_events", to: "home#ajax_load_events"
  get "/ajax_load_locations", to: "home#ajax_load_locations"
  get "/ajax_load_podcasts", to: "home#ajax_load_podcasts"
  get "/ajax_load_connect_groups", to: "home#ajax_load_connect_groups"
  get "/ajax_load_users", to: "home#ajax_load_users"

  #landing page routes go here

  ############################

  match "/loaderio-0077704941f2bf1a629295ce9fb1a229", :to => proc { |env| [200, {}, ["loaderio-0077704941f2bf1a629295ce9fb1a229"]] }, via: :get
  post "podcasts/upload", to: "audio_clips#create"

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  resources :locations, only: [:index, :new, :create]
  resources :locations, except: [:index, :new, :create], path: ""

  ### Routing for the new API ###
  namespace :api do
    namespace :v1 do
      resources :locations
      resources :podcasts
      resources :events
      resources :connect_groups
      get "/location/*id", to: "locations#get_location"
      get "/event/featured", to: "events#featured_events"
      get "/homedata", to: "home#index"
    end
  end
end
