AdminOkbrisbane::Application.routes.draw do

  match 'estates/:id/new_more' => 'estates#new_more', :via => :get, :as => "new_more_estate"
  match 'estates/:id/image' => 'estates#destroy_image', :via => :delete, :as => "estate_delete_image"
  #resources :estates
  resources :estates do
    collection do
      post :upload
    end
  end
  
  resources :sales_managements, :only => 'index'

  devise_for :admins
  
  resources :business_categories

  resources :business_profile_images

  mount Ckeditor::Engine => '/ckeditor'

  match 'client_images/:id' => 'client_images#destroy', :via => :post
  match 'client_images/:id/banner' => 'client_images#dettach', :via => :post, :as => "client_image_dettach"
  resources :client_images

  match 'business_clients/:id/images' => 'business_clients#destroy_image', :via => :delete, :as => "business_client_delete_all_images"
  resources :business_clients

  resources :banners

  get "main/index"

  resources :users

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

  resources :mains

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
