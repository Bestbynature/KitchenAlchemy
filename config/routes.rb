Rails.application.routes.draw do
  devise_for :users
  resources :recipe_foods
  resources :inventory_foods
  resources :foods
  resources :recipes
  resources :inventories

  root "foods#index"
end
