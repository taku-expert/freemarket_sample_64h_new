Rails.application.routes.draw do
  devise_for :users,
  controllers: {
   # registrations: 'users/registrations' ,
   omniauth_callbacks: 'users/omniauth_callbacks'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get "step1"
      post "step2"
      post "step3"
    end
  end

  namespace :items do
    resources :searches, only: :index
  end
  resources :items do
    resources :purchases, only: [:index] do
      collection do 
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end
  end
  resources :users, only: :show do 
    resources :card, only: [:index, :new, :create]
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
  get '/ancestry', to: "items#ancestry"
  
  root to: 'items#index'

end
