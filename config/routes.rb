# Rails.application.routes.draw do
#   devise_for :admin_users, ActiveAdmin::Devise.config
#   ActiveAdmin.routes(self)
#   resources :nodes
#   resources :places
#   resources :images
#   resources :cities do
#     collection do
#       get :get_cities
#     end
#   end

#   resources :states do
#     collection do
#       get :get_states
#     end
#   end 
#   resources :countries
#   resources :regions
#   resources :user_regions
#   resources :user_roles
#   devise_for :users
#   resources :companies
#   resources :managers 
#   root'companies#index'
 
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do
  resources :regions do
    member do 
      get :edit_region
    end 
    member do
      get :show_page
    end
  end

  resources :nodes do
    member do 
      get :edit_node
    end 
    member do
      get :show_page
    end
   end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :places do
    member do 
      get :edit_place
    end 
    member do
      get :show_page
    end
  end
  resources :images do
    collection do 
      get :login_page
    end 
    end
  resources :cities do
    collection do
      get :get_cities
      end
      member do
       get :show_page
      end
       member do
      get :edit_city
    end
  end 
  resources :states do
    collection do
      get :get_states
    end
    member do 
      get :edit_state
    end 
    member do
    get :show_page
    end
   end 

  resources :countries do
    member do 
      get :edit_country
    end 
    member do
      get :show_page
    end
  end

  resources :user_regions do
    member do 
      get :edit_user_region
    end 
    member do
      get :show_page
    end
  end

  resources :user_roles do
   member do 
      get :edit_user_role
    end 
    member do
      get :show_page
    end
  end

  resources :companies do
    member do 
      get :edit_company
    end 
    member do
      get :show_page
    end
  end
  
  resources :managers do
    member do
      get :show_page
    end
    member do
      get :edit_manager
    end
    

  end

  devise_for :users
  root 'companies#index'
  # get 'get_states' => "states#get_states"
  #  get 'get_cities' => "cities#get_cities"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end