Rails.application.routes.draw do
  namespace :public do
    get 'groups/index'
    get 'groups/show'
  end
  namespace :public do
    get 'labos/index'
    get 'labos/show'
  end
  namespace :public do
    get 'favorites/index'
  end
  namespace :public do
    get 'relationships/following'
    get 'relationships/follower'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/comfirm'
  end
  namespace :public do
    get 'music_posts/index'
    get 'music_posts/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'music_post_comments/index'
    get 'music_post_comments/show'
  end
  namespace :admin do
    get 'tags/index'
  end
  namespace :admin do
    get 'tag_labo_comments/index'
    get 'tag_labo_comments/show'
  end
  namespace :admin do
    get 'group_user_comments/index'
    get 'group_user_comments/show'
  end
  namespace :admin do
    get 'group_users/index'
  end
  namespace :admin do
    get 'user_post_comments/index'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :user do
    get 'groups/index'
    get 'groups/show'
  end
  namespace :user do
    get 'labos/index'
    get 'labos/show'
  end
  namespace :user do
    get 'favorites/index'
  end
  namespace :user do
    get 'relationships/following'
    get 'relationships/follower'
  end
  namespace :user do
    get 'users/show'
    get 'users/edit'
    get 'users/comfirm'
  end
  namespace :user do
    get 'music_posts/index'
    get 'music_posts/show'
  end
  namespace :user do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
