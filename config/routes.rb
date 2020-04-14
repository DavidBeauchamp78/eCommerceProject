Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :figures
  resources :contact
  resources :about
  resources :factions
  get '/', to: 'about#index'
  post 'figures/add_to_cart/:id', to: 'figures#add_to_cart', as: 'add_to_cart'
  post 'figures/increase_quantity/:id', to: 'figures#increase_quantity', as: 'increase_quantity'
  post 'figures/decrease_quantity/:id', to: 'figures#decrease_quantity', as: 'decrease_quantity'
  delete 'figures/remove_from_cart/:id', to: 'figures#remove_from_cart', as: 'remove_from_cart'
  get 'pages/cart' => 'high_voltage/pages#show', id: 'cart'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
