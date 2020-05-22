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
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month' # この行が追加対象です。
    end
    resources :attendances, only: :update
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end