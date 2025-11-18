Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :articles, only: [:index, :show, :create] do
    resources :translations, only: [:create]
  end

  resources :translations, only: [] do
    resources :favorites, only: [:create]
  end

  resources :favorites, only: [:index]
  resources :chats, only: [:show, :create] do
    resources :messages, only: [:create]
  end


end
