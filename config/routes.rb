Rails.application.routes.draw do
  # root to: "stations#index"
  root 'welcome#index'
  get 'GeoJSON', to: 'stations#GeoJSON'
  get 'checkout', to: 'checkouts#show'
  post 'create-checkout-session', to: 'checkouts#create'
  get 'cancel.html.erb', to: 'checkouts#cancel'
  get 'success.html.erb', to: 'checkouts#success'

  get 'membership', to: 'membership#show'
  #user profile
  get 'trip', to: 'users#trips'
  get 'billing', to: 'users#billing'
  post "create-customer-portal-session", to: 'users#create_customer_portal'

  get 'template', to:'users#template'
  # get 'checkout', to: 'checkouts#create-checkout-session'
  #successfully purchase the product
  #get 'checkout/success', to: 'checkouts#success' 
  # match '/billing', to:'billing#show'

  match '/about', to: "welcome#about", via: :get
  match '/index', to: "welcome#index", via: :get
  match '/service', to: "welcome#service", via: :get
  match '/stations/:identifier', to: "stations#show", via: :get
  # match '/login', to: "stations#index", via: :get
  get 'sign_up',  to: 'users#new', via: :get
  post 'sign_up', to: 'users#create'
  get 'sign_in',   to: 'sessions#new'
  post 'sign_in',   to: 'sessions#create', as: 'log_in'
  get 'logout',  to: 'sessions#destroy'

  
  # authenticate :user, lambda { |u| u.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  get 'stations', to: 'stations#index'


  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :sessions,   only: [:new, :create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

end