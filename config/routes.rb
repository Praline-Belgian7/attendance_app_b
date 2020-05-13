Rails.application.routes.draw do

  root "static_pages#top"
  
  get '/signup' => "users#new"
  
  # ログイン機能
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"
  
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end