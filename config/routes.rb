Rails.application.routes.draw do
  # ユーザー側
  # URL /customers/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 管理者側
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # ユーザー側
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :users do
        # ユーザー検索用
        collection do
          get 'search'
        end
      # 音楽共有
      resources :music_posts, only: [:index, :show, :create] do
        resource :favorites, only: [:index,:create, :destroy]
        resources :music_post_comments, only:[:create, :destroy, :update]
      end
      # ユーザー情報
      resources :users, only: [:show, :edit, :update, :destroy] do
        get 'confirm', on: :collection
        resources :relationships, only: [:create, :destroy]
          get 'followings' => 'relationships#followings', as: 'followings'
          get 'followers' => 'relationships#followers', as: 'followers'
      end
      # 探究室
      resources :labos, only: [:index, :show, :create, :update, :destroy] do
        resources :labo_comments, only: [:destroy]
      end 
      # グループ
      resources :groups, only: [:index, :show, :create, :update] do
        resources :group_user_comments, only: [:create, :destroy]
      end 
    end
  end
  
  # 管理者側
  namespace :admin do
    root to: "homes#top"
    # 検索用
    get "/search" => "homes#search"
    # 会員情報
    resources :users, only: [:index, :show, :edit, :destroy] do
      resources :user_post_comments, only: [:index, :destroy]
    end
    # グループ
    resources :group_users, only: [:index] do
      delete 'destroy', to: 'group#destroy', as: 'group_destroy'
      resources :group_user_comments, only: [:index, :show, :destroy]
    end
    # 探究室コメント
    resources :labo_comments, only: [:index, :show, :destroy]
    # タグ一覧・作成
    resources :tags, only: [:index, :create, :update] do 
      delete "destroy_all", on: :collection
    end 
    # 音楽共有
    resources :music_post_comments, only: [:index, :show, :destroy]
  end
end