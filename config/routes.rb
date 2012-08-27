AdminOkbrisbane::Application.routes.draw do
  
  resources :issues, :only => ['create','update']

  resources :legal_services, :only => ['create','update']

  resources :estates, :only => ['create','update']

  resources :businesses, :only => ['create','update']

  resources :motor_vehicles, :only => ['create','update']

  resources :accommodations, :only => ['create','update']

  resources :studies, :only => ['create','update']

  resources :immigrations, :only => ['create','update']

  resources :taxes, :only => ['create','update']

  resources :jobs, :except => ['new','destroy']

  resources :buy_and_sells, :except => ['new','destroy']

  resources :well_beings, :except => ['new','destroy']
  
  resources :comments, :only => ['index',"create"]
  
  [:sales_managements,:posts_managements,:issues_managements].each do |m|
    resources m, :only => ["index","destroy","edit","show"] do
      collection do
      get :write
      post :upload_image
      post :read_image_from_url
      post :upload_image_from_url
      post :get_image
      delete :delete_image
      post :upload_attachment
      post :get_attachment
      delete :delete_attachment
      end
   end
  end
  
  devise_for :admins

  resources :business_categories

  resources :business_profile_images

  mount Ckeditor::Engine => '/ckeditor'

  match 'client_images/:id' => 'client_images#destroy', :via => :post
  match 'client_images/:id/banner' => 'client_images#dettach', :via => :post, :as => "client_image_dettach"
  resources :client_images, :only => ["index","new","destroy","create","edit","update"]

  match 'business_clients/:id/images' => 'business_clients#destroy_image', :via => :delete, :as => "business_client_delete_all_images"
  resources :business_clients

  resources :banners, :except => ["new","destroy"] do
    collection do
      get :select
      get :image_size_index
      get :all_page_index
      post :attach_banner_image
      post :dettach_banner_image
      post :select_business_client_image
      post :select_banner_image
    end
  end

  get "main/index"

  match "users/:id/clean_image" => "users#clean_image", :via => :delete, :as => "users_clean_image"
  match "users/:id/clean_attachment" => "users#clean_attachment", :via => :delete, :as => "users_clean_attachment"
  resources :users, :only => ["index","show","destroy"]

  match "okadmins/:id" => "okadmins#destroy", :via => :delete, :as => "okadmins_delete"
  match "okadmins" => "okadmins#index", :via => :get, :as => "okadmins"
  match "okadmins/:id" => "okadmins#show", :via => :get, :as => "okadmin"
  match "okadmins/:id/clean_image" => "okadmins#clean_image", :via => :delete, :as => "okadmins_clean_image"
  match "okadmins/:id/clean_attachment" => "okadmins#clean_attachment", :via => :delete, :as => "okadmins_clean_attachment"

  resources :okadmins, :only => []
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :mains, :only => ["index"]

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'main#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
