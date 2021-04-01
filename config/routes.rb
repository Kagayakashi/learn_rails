Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_for :admins, path: 'admins'

  
  # https://guides.rubyonrails.org/routing.html
  
  resources :categories
  
  # GET /test_passages/123/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
  
  #resources :tests, except: :index do
  resources :tests, only: :start do
    member do
      post :start
    end
  end
  
  namespace :admin do
    resources :categories
 	  
    resources :tests do
      resources :questions do
        resources :answers
      end
    end
    
    root to: 'categories#index'
  end

  get 'sessions/new'
  get 'users/new'

  get 'categories' => 'categories#index', as: 'user_root'
  
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
