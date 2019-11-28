Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'
  resources :seedpackages, only: [:index, :show, :new, :create, :edit, :update] do
    resources :transactions, only: :create
  end

  delete '/seedpackages/:id', to: 'seedpackages#destroy', as: :seedpackages_delete

end
