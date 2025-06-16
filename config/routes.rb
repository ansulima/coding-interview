Rails.application.routes.draw do

  post 'reports', to: 'reports#create'

  resources :companies
  resources :companies, only: [] do
    resources :users, only: [:index]
  end

  resources :tweets, only: [:index]
  resources :users, param: :username, only: [:index, :show] do
    resources :tweets, only: [:index]
  end
end
