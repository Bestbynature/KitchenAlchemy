Rails.application.routes.draw do
  resources :recipe_foods
  resources :inventory_foods
  resources :foods
  resources :recipes
  resources :inventories

  root "foods#index"
end
