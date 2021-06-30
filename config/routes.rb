# frozen_string_literal: true
Rails.application.routes.draw do

  #get '/posts/post_show', to: 'posts#index'

  #get '/users/show', to: 'users#index'
  resources :organizations do
    resources :users
    resources :posts
  end

  #users :posts
  root to: 'organizations#index'
end

