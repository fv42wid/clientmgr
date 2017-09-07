Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers, only: [:index, :show, :new, :create, :update]
  resources :projects, only: [:index, :show, :new, :create, :update]
  resources :consultants
  resources :awsaccounts

  root 'customers#index'
end
