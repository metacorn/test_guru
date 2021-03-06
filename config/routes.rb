Rails.application.routes.draw do
    
  root to: 'tests#index'
  get '/feedback', to: 'feedbacks#new'
  post '/feedback', to: 'feedbacks#create'
  get '/badges', to: 'badges#index'

  devise_for :users,  path: :gurus,
                      path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges, only: %i[index show new create destroy]
  end
end
