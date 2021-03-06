Rails.application.routes.draw do
  get 'rent_farmlands/index'
  get 'rent_farmlands/show'
  get 'rent_farmlands/new'
  get 'rent_farmlands/edit'
  root 'static_pages#top'
  get  '/about',            to: 'static_pages#about'
  get  '/contact',          to: 'static_pages#contact'
  get  '/privacy_policy',   to: 'static_pages#privacy_policy'
  get  '/terms_of_service', to: 'static_pages#terms_of_service'
  get  '/signup',           to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
<<<<<<< HEAD
<<<<<<< HEAD
      get    :withdrawal_confirmation, :following, :followers
      delete :withdrawal_destroy
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :posts, only: %i[index show create destroy] do
    resources :comments, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
=======
      get    'withdrawal_confirmation'
      delete 'withdrawal_destroy'
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
  resources :posts
>>>>>>> master
=======
      get    :withdrawal_confirmation, :following, :followers
      delete :withdrawal_destroy
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :posts, only: %i[index show create destroy] do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
  resources :matching, only: [:index]
  resources :chat_rooms, only: %i[create show]
  resources :notifications, only: %i[index update]
  resources :lend_farmlands, :rent_farmlands
>>>>>>> master
end
