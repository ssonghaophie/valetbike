Rails.application.routes.draw do
  root to: "stations#index"

  match '/about', to: "stations#about", via: :get
  match '/index', to: "stations#index", via: :get

  resources :users do
    member do
      get :delete
    end
  end


end