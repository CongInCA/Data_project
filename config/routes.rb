Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get '/transit_performances', to: 'transit_performances#index'

  get '/about', to: 'transit_performances#about'

  # Defines the root path route ("/")
  root "transit_performances#index"

  resources :transit_performances
  resources :transit_performances, only: [:index, :show]

end
