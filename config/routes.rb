Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"

  devise_for :users, path: 'auth',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               password: 'secret',
               confirmation: 'verification',
               unlock: 'unblock',
               sign_up: 'register',
             }

  resources :feedbacks, only: %i[new create], shallow: true

  resources :categories, only: %i[show index]
  resources :test_passages, only: %i[show update], shallow: true do
    resources :gists, only: %i[create]
    member do
      get :result
    end
  end

  resources :tests, only: :start do
    member do
      post :start
    end
  end

  namespace :admin do
    resources :gists, only: %i[index]
    resources :rewards, except: %i[show]
    resources :categories, shallow: true do
      resources :tests, except: %i[index], shallow: true do
        patch :update_inline, on: :member
        resources :questions, except: %i[index], shallow: true do
          resources :answers, except: %i[index show], shallow: true
        end
      end
    end
    root to: 'categories#index'
  end

  root to: 'categories#index'
end
