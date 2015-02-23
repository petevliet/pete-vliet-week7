Rails.application.routes.draw do

  root 'users#index'

  resources :users, :courses

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
