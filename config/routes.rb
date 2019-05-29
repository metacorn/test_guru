Rails.application.routes.draw do
  
  namespace :admin do
    get 'gists/index'
  end
  root to: 'tests#index'

  devise_for :users,  path: :gurus,
                      path_names: { sign_in: :login, sign_out: :logout },
                      controllers: {registrations:"registrations"}

  resources :tests, only: :index do
    # resources :questions, shallow: true, except: :index do
    #   resources :answers, shallow: true, except: :index
    # end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
