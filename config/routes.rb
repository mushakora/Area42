Rails.application.routes.draw do
  root 'home#top'
  get 'home/top'
  get 'home/about'
  get 'home/login'
  get 'admin/home/top'
  get 'coupon/index'
  devise_for :admins
  devise_for :users
  get 'users/withdrawal', to: 'users#withdrawal'
  put '/users/:id/hide' => 'users#hide', as: 'users_hide'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
  resources :items, only: [:index, :show]

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :new, :create]
    resources :materials, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
  end

end
