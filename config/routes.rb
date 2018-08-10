require 'resque/server'

Rails.application.routes.draw do
  
   mount Resque::Server.new, at: "/resque"

  devise_for :views
  post 'likes/toggle/:post_id', to: 'likes#toggle', as: :toggle_like

  post 'comments/create', as: :comments
  delete 'comments/:id', to: 'comments#destroy', as: :destroy_comment

	# Post routes
  root 'posts#home' , as: :root
  post 'posts/create', as: :posts
  delete 'posts/:id', to: 'posts#destroy', as: :destroy_post

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
