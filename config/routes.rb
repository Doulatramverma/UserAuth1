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
      get :show_page
      post :comments
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
      get :show_page
      post :comments
      put "like", to: "places#upvote"
      put "dislike", to: "places#downvote"
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
      get :edit_city
      post :comments
      put "like", to: "cities#upvote"
      put "dislike", to: "cities#downvote"
    end
  end 

  resources :states do
    collection do
      get :get_states
    end
    member do 
      get :edit_state
      get :show_page
      post :comments
      put "like", to: "states#upvote"
      put "dislike", to: "states#downvote"
    end
  end 

  resources :countries do
    member do
      get :edit_country
      get :show_page
      post :comments
      put "like", to: "countries#upvote"
      put "dislike", to: "countries#downvote"
    end
  end

  resources :user_regions do
    member do 
      get :edit_user_region
      get :show_page
      post :comments
    end
  end

  resources :user_roles do
   member do 
      get :edit_user_role
      get :show_page
      post :comments
    end
  end

  resources :companies do
    resources :comments
     member do
      put "like", to: "companies#upvote"
      put "dislike", to: "companies#downvote"
    end 
  
    member do 
      get :edit_company
      get :show_page
    end 
    
  end
  
  resources :managers do
    member do
      get :show_page
      get :edit_manager
      
    end
  end

 resources :comments, only: [] do
   member do 
     put "like", to: "comments#upvote" 
     put "dislike", to: "comments#downvote" 
    end 
  end
  

  devise_for :users
  root 'companies#index'
  # get 'get_states' => "states#get_states"
  #  get 'get_cities' => "cities#get_cities"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end