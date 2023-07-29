Rails.application.routes.draw do
  root "foods#index"

  devise_for :users

  resources :recipe_foods
  resources :inventory_foods
  resources :foods
  resources :recipes
  resources :inventories
  resources :users, only: [:index]

  get '/public_recipes', to: 'public_recipes#index'
  get 'generate_shopping_list/:id', to: 'shopping_lists#generate', as: :generate_shopping_list

end
