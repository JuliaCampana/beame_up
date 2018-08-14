Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :scooters do
    collection do
      get 'my_scooters', to: 'scooters#my_scooters'
    end
  end


end
