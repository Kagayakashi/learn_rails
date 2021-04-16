Rails.application.routes.draw do
  devise_for :users, path: 'auth',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      sign_up: 'register',
    }

  resources :categories, only: %i[show index]
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :tests, only: :start do
    member do
      post :start
    end
  end
  
  namespace :admin do
    get'gists/github', to: 'gists#github'

    resources :gists, only: %i[index github]
    resources :categories, shallow: true do
      resources :tests, except: %i[index], shallow: true do
        resources :questions, except: %i[index], shallow: true do
          resources :answers, except: %i[index show], shallow: true
        end
      end
    end
    root to: 'categories#index'
  end

  root to: 'categories#index'
end
