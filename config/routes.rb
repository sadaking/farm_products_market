Rails.application.routes.draw do
  #ホーム画面
  root to: 'products#index'

  #生産者情報関連
  devise_for :producers, controllers: {
    sessions:      'producers/sessions',
    passwords:     'producers/passwords',
    registrations: 'producers/registrations'
  }
  resources :producers, only: %i[show]

  #消費者情報関連
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show]
  #管理者
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #商品関連
  resources :products
  resources :products do
    #コメント
    resources :comments
    #購入処理
    resources :purchases, only: %i[index] do
      collection do
        get 'index', to: 'purchases#index'
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end
  end

  #お気に入り
  resources :favorites, only: %i[create destroy index]

  #メッセージ一覧画面
  resources :message_tops, only: %i[index]

  #メッセージルーム
  resources :rooms, only: %i[show create] do
    resources :messages, only: %i[create]
  end

  #カード情報関連
  resources :cards, only: %i[new show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end
