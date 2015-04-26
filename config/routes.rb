PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: :destroy do
    member do
      post :vote
    end
    resources :comments, only: :create do
      member do
        post :vote
      end
    end
  end
  resources :categories, only: [:show,:new,:create]

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:create, :edit, :update, :show]
end
