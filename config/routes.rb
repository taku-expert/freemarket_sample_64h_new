Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  root to: 'posts#index'

  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get "step1"
      post "step2"
      post "step3"
    end
  end
=======
  resources :items, only: [:index, :new, :create, :show]
  resources :users, only: :show do 
    resources :card, only: :index
  end
  resources :items
  get '/mypage', to: "users#mypage"
  get '/profile', to: "users#profile"
  get '/confirmation', to: "users#confirmation"
  get '/logout', to: "users#logout"
  get '/product-listing', to: "posts#product-listing"
  get '/purchase', to: "posts#purchase"
  get '/show', to: "posts#show"
  get '/login', to: "devise/registration#login"

  root to: 'items#index'

>>>>>>> master
end
