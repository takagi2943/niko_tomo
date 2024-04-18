Rails.application.routes.draw do
  namespace :admin do
    get 'labo_comments/index'
    get 'labo_comments/show'
  end
  # ユーザー側
  # URL /customers/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  # ゲストユーザー側
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # 管理者側
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  # ユーザー側
  scope module: :public do
    root to: 'homes#top'
    get 'group_messages/create'
    get '/about' => 'homes#about'
    # 探究室
    resources :labos, only: [:index, :show, :create, :update, :destroy] do
      resources :labo_comments, only: [:destroy]
    end

    # 音楽共有
    resources :music_posts, only: [:index, :show, :edit, :create, :update, :destroy] do
      resource :favorites, only: [:index,:create, :destroy]
      resources :music_post_comments, only:[:create, :destroy, :update]
    end

    # ユーザー情報
    resources :users, only: [:show, :edit, :update, :destroy] do
      get 'confirm', on: :member
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      # ユーザー検索用
      collection do
        get 'search'
      end
      resources :nikos, only: [:create, :update, :destroy]
      resources :relationships, only: [:create, :destroy]
    end
    # グループ
    resources :groups, only: [:index, :show, :create, :update, :edit, :create] do
      get 'join' => 'groups#join'
      delete 'leave', on: :member
      resources :group_user_comments, only: [:create, :destroy]
    end
  end

  # 管理者側
  namespace :admin do
    root to: 'homes#top'
    # 検索用
    get '/search' => 'homes#search'
    # 会員情報
    resources :users, only: [:index, :show, :edit, :destroy] do
      resources :user_post_comments, only: [:index, :destroy]
      get '/comments' => 'user_comments#comment'
      member do
        patch '/comments' => 'comments#update'
        delete '/comments' => 'comments#destroy'
      end
    end
    # グループ
    resources :groups do
      resources :group_users, only: [:index] do
        delete 'destroy', to: 'group#destroy', as: 'group_destroy'
        resources :group_user_comments, only: [:index, :show, :destroy]
      end
    end
    # 探究室コメント
    resources :labos, only: [:index, :show, :create, :update, :destroy] do
      resources :labo_comments, only: [:index, :destroy]
    end
    #resources :labo_comments, only: [:index, :show, :destroy]
    # タグ一覧・作成
    resources :tags, only: [:index, :create, :edit, :update, :destroy] do
      delete 'destroy_all', on: :collection
    end
    # 音楽共有
    resources :music_posts, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :music_post_comments, only:[:index, :destroy]
    end
    #resources :music_post_comments, only: [:index, :show, :destroy]
  end
end
