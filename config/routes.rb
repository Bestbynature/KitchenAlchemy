Rails.application.routes.draw do
  root "foods#index"

  devise_for :users

  resources :recipe_foods
  resources :inventory_foods
  resources :foods
  resources :recipes
  resources :inventories

  get '/public_recipes', to: 'public_recipes#index'

end
