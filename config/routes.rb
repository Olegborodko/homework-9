Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  
  resources :users
  resources :posts
  resources :sessions

  get 'users/:id/posts', to: 'posts#users_posts', as: :users_posts

end
