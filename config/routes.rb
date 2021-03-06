Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  resources :users, only: [:show]
  resources :experiences, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'location'
    end
  end

  get 'search' => 'pages#search'

end
