Rails.application.routes.draw do
  root to: "stations#index"

  match '/about', to: "stations#about", via: :get
end