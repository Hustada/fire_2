Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do
    get 'users/sign_in' => 'devise/sessions#new'
    get 'users/sign_out' => 'devise/sessions#destroy'
    match 'users/:id', to: 'users#show', as: 'user', via: 'get'
  end

  resources :pits do
    put "like", to: "pits#upvote"
      put "dislike", to: "pits#downvote"
    resources :comments do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
  




  root to: 'pages#home'
  get '/about' => 'pages#about'
end