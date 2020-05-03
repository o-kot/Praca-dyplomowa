Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  get 'index/index'  
  get 'profile/profile' => 'profile#profile', :as => :profile
  get 'about/about' => 'about#about', :as => :about
  get 'meals/meals' => 'meals#meals', :as => :meals
  get 'recipes/recipes' => 'recipes#recipes', :as => :recipes
  get 'recipes/delete' => 'recipe#delete', :as => :delete_recipe
  get 'user_products/user_products' => 'user_products#user_products', :as => :user_products
  get 'user_products/delete' => 'user_products#delete', :as => :delete_product
  get 'modal/modal' => 'modal#modal', :as => :modal
  get 'logout' => 'login#logout'
  post 'register' => 'register#register'
  post 'login' => 'login#login'
  post 'data' => 'user_data#data'
  post 'editData' => 'user_data#edit'
  post 'measurements' => 'user_measurements#measurements'
  post 'editMeasurement' => 'user_measurements#edit'
  post 'target' => 'target#target'
  post 'activity' => 'activity#activity'
  get 'user_requisition/requisition' => 'user_requisition#requisition'
  post 'modifyRequisition' => 'user_requisition#modifyRequisition'
  post 'acceptRequisition' => 'user_requisition#acceptRequisition'
  post 'addUserProduct' => 'user_products#add'
  post 'addRecipe' => 'recipe#add'
end
