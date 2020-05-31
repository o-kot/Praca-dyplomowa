Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  get 'index/index'
  get 'profile/profile' => 'profile#profile', :as => :profile
  get 'about/about' => 'about#about', :as => :about
  get 'meals/meals' => 'meals#meals', :as => :meals
  get 'products/products' => 'products#products', :as => :products
  get 'recipes/recipes' => 'recipes#recipes', :as => :recipes
  get 'recipes/delete' => 'recipe#delete', :as => :delete_recipe
  get 'recipes/mark_as_eaten' => 'complete_recipe#markAsEaten', :as => :end_recipe
  get 'user_products/user_products' => 'user_products#user_products', :as => :user_products
  get 'user_products/delete' => 'user_products#delete', :as => :delete_product
  get 'recipe/delete' => 'recipe#deleteProduct', :as => :delete_product_from_recipe
  get 'modal/modal' => 'modal#modal', :as => :modal
  get 'logout' => 'login#logout'
  get 'profile/delete' => 'user_measurements#delete', :as => :delete_measurement
  post 'register' => 'register#register'
  post 'login' => 'login#login'
  post 'data' => 'user_data#userData'
  post 'editData' => 'user_data#edit'
  post 'measurements' => 'user_measurements#userMeasurements'
  post 'addMeasurement' => 'user_measurements#addNew'
  post 'editMeasurement' => 'user_measurements#edit'
  post 'target' => 'target#target'
  post 'activity' => 'activity#activity'
  get 'user_requisition/requisition' => 'user_requisition#requisition'
  post 'modifyRequisition' => 'user_requisition#modifyRequisition'
  post 'acceptRequisition' => 'user_requisition#acceptRequisition'
  post 'addUserProduct' => 'user_products#add'
  post 'editUserProduct' => 'user_products#edit'
  post 'userProducts' =>  'user_products#user_products'
  post 'addRecipe' => 'recipe#add'
  post 'editRecipe' => 'recipe#edit'
  post 'addProductsToRecipe' => 'recipe#addProduct'
  post 'weightProducts' => 'complete_recipe#weightProducts'
  post 'measureRecipe' => 'complete_recipe#measureRecipe'
  post 'addMeal' => 'eaten#addMeal'
  post 'addRecipeToMeal' => 'eaten#addCompleteRecipe'
  post 'addProductToMeal' => 'eaten#addProduct'
  post 'addCustomProduct' => 'eaten#addCustomProduct'
  post 'decompose' =>'eaten#decompose'
  post 'nutrients' => 'products#searchForNutrient'
  get 'meals/delete' => 'eaten#delete', :as => :delete_meal
end
