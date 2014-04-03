Rails.application.routes.draw do

  get "/all" => "home#all" , :as => "songenglish"
  get "/location" => "home#location" , :as => "location"

  get "/songs/english" => "songs#english" , :as => "songs_english"
  get "/songs/hindi" => "songs#hindi" , :as => "songs_hindi"
  get "/songs/punjabi" => "songs#punjabi" , :as => "songs_punjabi"
  resources :songs
  

  get "/pictures/personal" => "pictures#personal" , :as => "pictures_personal"
  get "/pictures/family" => "pictures#family" , :as => "pictures_family"
  get "/pictures/friends" => "pictures#friends" , :as => "pictures_friends"
  resources :pictures



  get "/videos/english" => "videos#english" , :as => "videos_english"
  get "/videos/hindi" => "videos#hindi" , :as => "videos_hindi"
  get "/videos/punjabi" => "videos#punjabi" , :as => "videos_punjabi"
  resources :videos



  get 'users/new'
  get 'register' => "users#new", :as => "register"


  get "log_out" => "sessions#destroy", :as => "log_out"
get "login" => "sessions#new", :as => "login"
# get "sign_up" => "users#new", :as => "sign_up"
root :to => "sessions#new"
resources :users
resources :sessions

get "/profile" => "profiles#show" , :as => "profil"
get "/profile/edit" => "profiles#edit" , :as => "edit"
post "/profile/edit" => "profiles#update"
# resources :profiles
get "/home" => "home#index"


get "videos/:id/set_fav" => "videos#set_fav", :as => "set_fav_video"
get "videos/:id/unset_fav" => "videos#unset_fav", :as => "unset_fav_video"

get "pictures/:id/set_fav" => "pictures#set_fav", :as => "set_fav_picture"
get "pictures/:id/unset_fav" => "pictures#unset_fav", :as => "unset_fav_picture"

get "songs/:id/set_fav" => "songs#set_fav", :as => "set_fav_song"
get "songs/:id/unset_fav" => "songs#unset_fav", :as => "unset_fav_song"

# post "/login" => "sessions#create"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
