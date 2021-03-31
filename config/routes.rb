Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  devise_for :admins, controllers: { registrations: "registrations" }
  
  get 'sessions/new'
  get 'users/new'
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
 	resources :tests, :categories, :answers, :questions
 end

  root to: 'categories#index'
end
