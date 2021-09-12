Rails.application.routes.draw do
  get 'settings/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions
  root to: redirect('sessions/new')
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'sessions/show'
  post 'sessions/createSession'
  post 'sessions/joinSession'

  resources :cards
  get :deckoverview, controller: :cards
  root to: redirect('/cards')

  resources :users
  get 'users/show'
  get :user_hand, controller: :users
  post 'users/draw'
  post 'cards/deal_all'
  post 'users/update'
  post 'users/increment_score'
  post 'users/decrement_score'

  resources :settings
  post 'settings/index'

end
