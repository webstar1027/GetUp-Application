Rails.application.routes.draw do
  
  devise_for :users, controllers: {
   sessions: 'users/sessions',
   passwords: 'users/passwords',
   registrations: 'users/registrations',
   omniauth_callbacks: 'users/omniauth_callbacks'
 }

  namespace :admin do
    root to: 'dashboards#index'
    resources :users do 
      member do
        get :toggle_enable_status
      end
    end
    resources :deals do
      collection do
        get :requests
      end
      member do 
        get :approve
      end 
    end
    resources :pois
    resources :quests do 
      member do
        get :resume
        get :pause
      end
    end
    resources :business_owners do
      member do
        get :toggle_enable_status
      end
    end
    resources :dashboards, only: [:index]
    resources :quest_request
  end
 
  resources :friends
  resources :landmarks
  resources :quests do
    member do
      post :pause
      post :resume
    end
  end
  resources :deals do
    resources :coupons
  end
  resources :businesses
  resources :pois
  resources :business_owners
  resources :coupons
  resources :quest_request, only: [:index] do
    resources :quests, controller: "quest_request/quests", only: [:new, :create]
  end
    
  devise_scope :user do
    get '/business/sign_up', to: 'devise/registrations#new'
    get '/business/sign_in', to: 'devise/sessions#new'
    get '/users/forgot_password', to: 'devise/passwords#new'
  end

  resources :public_quests, only: [:index, :show]
  resources :feedbacks, only: [:new, :create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'pages#home'
  
  get '/survey', to: "pages#questionaire"
  get '/profile', to: "pages#my_profile"
  get '/business_profile/:user_id', to: "pages#business_profile"
  get '/get_user_deals/:user_id', to: "deals#get_user_deals"
  get '/get_user_quests/:user_id', to: "deals#get_user_quests"
  get 'toggle_enable_status/:id', to: "business_owners#toggle_enable_status"
  get '/edit_profile', to: "pages#edit_profile"
  get '/settings', to: "pages#settings"
  
  patch '/update_profile', to: "pages#update_profile"
  
  
  get '/dashboard', to: "pages#dashboard"
  get '/bo-dashboard', to: "pages#bo_dashboard"
  get '/user-dashboard', to: "pages#user_dashboard"
  post '/claim-deals/:id', to: "deals#claim", as: 'claim'
  post '/redeem-coupon/:id', to: "coupons#redeem", as: 'redeem'
  get '/deals-list', to: 'deals#public_show'
  get '/deal-requests', to: 'deals#requests'
  post '/approve-deals/:id', to: "deals#approve", as: 'approve_deal'
  get '/bo-quests-list', to: 'deals#super_deals'
  get 'request-for-quest', to: 'deals#request_for_quest'
end
