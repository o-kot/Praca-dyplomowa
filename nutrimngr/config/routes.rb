Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  get 'index/index'  
  get 'profile/profile' => 'profile#profile', :as => :profile
  get 'about/about' => 'about#about', :as => :about
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
end
