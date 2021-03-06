Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Resources examples
  ## Default actions
  # - resources :cars
  # - resources :dealer, controller: :seller
  # - resources :cars, only: %i[index show]
  # - resources :cars do
  #     resources :models
  #   end
  # - resources :cars do
  #     resources :models, shallow: true
  #   end
  ## Custom actions
  # - resources :models do
  #     get :discount, on: :collection
  #     member do # member = each item from resource
  #       post :test_drive
  #     end
  #   end
  
  # Non-resources examples
  # - get '/cars', to 'cars#index'
  # - get '/cars/:id', to: 'cars#show', as: :test
  # - get '/cars(/:id)', to: 'cars#show'  # ID optional
  # - get '/models/:id/test_drive', to: 'models#test_drive'
  #
  # - match '/cars/:id', to 'cars#act', via: %i[post get put]
  # transfer http methods post get put from /cars/1 to controller method cars->act
  # - match '/cars/:id', to 'cars#act', via: :all
  
  # /cars/740/m62
  # hardcoded level value
  # - get '/cars/:model/:engine', to: 'cars#search', level: 2
  
  # root to: models#newest # home page is newest car model
  
  # exec - rails routes
  
  resources :categories
  
  # GET /test_passages/123/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
  
  resources :tests, except: :index do
    resources :questions, except: :index, shallow: true do
      resources :answers, only: %i[new create edit update destroy], shallow: true
    end
    
    member do
      post :start
    end
  end
  
  root to: 'categories#index'
end
