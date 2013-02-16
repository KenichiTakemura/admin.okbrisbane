AdminOkbrisbane::Application.routes.draw do
  
  resources :rates, :only => ['index'] do
    collection do
      get :collect
    end
  end
  
  resources :weathers, :only => ['index'] do
    collection do
      get :collect
    end
  end
  
  resources :issues, :only => ['create','update']

  resources :laws, :only => ['create','update']

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
  
  resources :quick_links
  
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

  resources :business_categories do
    collection do
      get :query
      post :search
    end
  end
  
  
  resources :admin_notices

  resources :contacts, :only => ["index","destroy","edit","show","update"]

  resources :business_profile_images, :only => ["index","new","create","destroy"]
  resources :logos, :only => ["index","new","create","destroy"]

  resources :system_settings, :only => ["index","edit","update"]
  
  resources :statistics, :only => [] do
    collection do
      get :hit_counter
      get :most_clicked
    end 
  end

  mount Ckeditor::Engine => '/ckeditor'

  match 'client_images/:id/destroy' => 'client_images#destroy', :via => :post
  match 'client_images/:id/banner' => 'client_images#dettach', :via => :post, :as => "client_image_dettach"
  resources :client_images, :only => ["index","new","destroy","create","edit","update"] do
    collection do
      post :image_size_for
    end
  end

  match 'business_clients/:id/images' => 'business_clients#destroy_image', :via => :delete, :as => "business_client_delete_all_images"
  resources :business_clients do
    collection do
      post :select_category
      get :query
      post :search
    end
  end

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
  match "users/:id/block" => "users#block_user", :via => :post, :as => "users_block"
  match "users/:id/unblock" => "users#unblock_user", :via => :post, :as => "users_unblock"
  resources :users, :only => ["index","show","destroy"]
  match "okadmins/:id" => "okadmins#destroy", :via => :delete, :as => "okadmins_delete"
  match "okadmins" => "okadmins#index", :via => :get, :as => "okadmins"
  match "okadmins/:id" => "okadmins#show", :via => :get, :as => "okadmin"
  match "okadmins/:id/clean_image" => "okadmins#clean_image", :via => :delete, :as => "okadmins_clean_image"
  match "okadmins/:id/clean_attachment" => "okadmins#clean_attachment", :via => :delete, :as => "okadmins_clean_attachment"
  resources :okadmins, :only => []
  resources :mains, :only => ["index"]
  root :to => 'main#index'
end
