AdminOkbrisbane::Application.routes.draw do

  match 'legal_services/:id' => 'legal_services#destroy', :via => :delete, :as => "legal_service_delete"
  resources :legal_services, :except => 'destroy' do
    collection do
      post :upload
    end
  end
  
  match 'estates/:id' => 'estates#destroy', :via => :delete, :as => "estate_delete"
  resources :estates, :except => 'destroy' do
    collection do
      post :upload
    end
  end
  
  match 'businesses/:id' => 'businesses#destroy', :via => :delete, :as => "business_delete"
  resources :businesses, :except => 'destroy' do
    collection do
      post :upload
    end
  end
  
  match 'motor_vehicles/:id' => 'motor_vehicles#destroy', :via => :delete, :as => "motor_vehicle_delete"
  resources :motor_vehicles, :except => 'destroy' do
    collection do
      post :upload
    end
  end
  
  match 'accommodations/:id' => 'accommodations#destroy', :via => :delete, :as => "accommodation_delete"
  resources :accommodations, :except => 'destroy' do
    collection do
      post :upload
    end
  end


  match 'studies/:id' => 'studies#destroy', :via => :delete, :as => "study_delete"
  resources :studies, :except => 'destroy' do
    collection do
      post :upload
    end
  end

  match 'immigrations/:id' => 'immigrations#destroy', :via => :delete, :as => "immigration_delete"
  resources :immigrations, :except => 'destroy' do
    collection do
      post :upload
    end
  end

  match 'taxes/:id' => 'taxes#destroy', :via => :delete, :as => "tax_delete"
  resources :taxes, :except => 'destroy' do
    collection do
      post :upload
    end
  end

  match 'jobs/:id' => 'jobs#destroy', :via => :delete, :as => "job_delete"
  resources :jobs, :except => 'destroy' do
    collection do
      post :upload
    end
  end
  
  match 'buy_and_sells/:id' => 'buy_and_sells#destroy', :via => :delete, :as => "buy_and_sell_delete"
  resources :buy_and_sells, :except => 'destroy' do
    collection do
      post :upload
    end
  end
  
  match 'sales_managements/:id/image' => 'sales_managements#destroy_image', :via => :delete, :as => "sales_managements_delete_image"  
  resources :sales_managements, :only => ["index"]

  match 'posts_managements/:id/attachment' => 'posts_managements#destroy_attachment', :via => :delete, :as => "posts_managements_delete_attachment"  
  match 'posts_managements/:id/image' => 'posts_managements#destroy_image', :via => :delete, :as => "posts_managements_delete_image"  
  resources :posts_managements, :only => ["index"]
  
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
      post :attach_banner_image
      post :dettach_banner_image
      post :select_business_client_image
      post :select_banner_image
    end
  end

  get "main/index"

  match "users/:id/clean_image" => "users#clean_image", :via => :delete, :as => "users_clean_image"
  match "users/:id/clean_attachment" => "users#clean_attachment", :via => :delete, :as => "users_clean_attachment"
  resources :users, :except => ["new"]

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
