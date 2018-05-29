Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, only: :sessions

  resources :requests, only: [:index, :new, :create, :update] do
    member do
      get :confirm_email
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
