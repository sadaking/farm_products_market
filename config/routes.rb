Rails.application.routes.draw do
  root to: 'products#index'
  resources :products
  resources :products do
    resources :comments
    post :pay, on: :member
  end
  resources :favorites, only: %i[create destroy index]
  resources :message_tops, only: %i[index]

  devise_for :producers, controllers: {
    sessions:      'producers/sessions',
    passwords:     'producers/passwords',
    registrations: 'producers/registrations'
  }
  resources :producers, only: [:show]
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :rooms, :only => [:show, :create] do
    resources :messages, :only => [:create]
  end
end
