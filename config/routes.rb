Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'pages#home'
  get '/about', to: 'pages#about'

  # resources :sessions, only: [:show, :create, :destroy]

  get '/login', to: 'sessions#show'
  post '/login', to: 'sessions#create'

  # get '/logout', to: 'sessions#destroy'
  # delete '/logout', to: 'sessions#destroy'
  match '/logout', to: 'sessions#destroy', via: [:get, :delete]


  resource :user, except: [:destroy] do
    resource :profile, except: [:destroy]
  end

  resources :profiles do
    member do
    #   # match 'vote/up', 'profiles#vote', via: [:get], direction: 'up'
    #   # match 'vote/down', 'profiles#vote', via: [:get], direction: 'down'
      match 'vote/:direction', to: 'profiles#vote', via: [:get], as: 'vote'
    end
  end

  namespace :admin do
    resources :users, only: [:index] do
      resource :profile
    end
  end
end
