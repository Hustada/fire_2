Rails.application.routes.draw do
  root to: 'pages#home'

  get '/about' => 'pages#about'
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    get 'users/sign_in' => 'devise/sessions#new'
    get 'users/sign_out' => 'devise/sessions#destroy'
    match 'users/:id', to: 'users#show', as: 'user', via: 'get'
  end

  resources :pits do
    put "like", to: "pits#upvote"
      put "dislike", to: "pits#downvote"
      get 'tags/:tag', to: 'pits#index'
    resources :comments do
      put "edit", to: "comments#edit"
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
    get 'tags/:tag', to: 'pits#index', as: :tag
end