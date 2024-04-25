Rails.application.routes.draw do
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
    get '/genre/search' => 'searches#genre_search'
    # 探究室
    resources :labos, only: [:index, :show, :create, :update, :destroy] do
      resources :labo_comments, only: [:create,:destroy]
    end
    # tagと紐づけを行うためのlabo
    resources :tags do
      member do
        get :labos
        delete :labo
      end
    end

    # 音楽共有
    resources :music_posts, only: [:index, :show, :edit, :create, :update, :destroy] do
      resource :favorites, only: [:index,:create, :destroy]
      resources :music_post_comments, only:[:create, :destroy, :update]
    end

    # ユーザー情報
    resources :users, only: [:show, :edit, :update, :destroy, :index] do
      get 'confirm', on: :member
      member do
        get 'followings'
        get 'followers'
      end
      # ユーザー検索用
      collection do
        get 'search'
      end

      post 'user_music_posts', to: 'user_music_mosts#create', as: 'user_music_posts'

      resources :nikos, only: [:create, :update, :destroy]
      resource :relationships, only: [:create, :destroy]
    end
    # グループ
    resources :groups, only: [:index, :show, :create, :update, :edit, :create, :destroy] do
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
    resources :users, only: [:index, :show, :edit, :destroy, :update] do
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
      resources :labo_comments, only: [:index, :destroy, :show]
    end
    #resources :labo_comments, only: [:index, :show, :destroy]
    # タグ一覧・作成
    resources :tags, only: [:index, :create, :edit, :update, :destroy] do
      delete 'destroy_all', on: :collection
    end
    # 音楽共有
    resources :music_posts, only: [:index, :show, :destroy] do
      resources :music_post_comments, only:[:index, :destroy]
    end
    #resources :music_post_comments, only: [:index, :show, :destroy]
  end
end
