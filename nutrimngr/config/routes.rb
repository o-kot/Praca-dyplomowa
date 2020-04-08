Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  get 'index/index'  
  get 'profile/profile' => 'profile#profile', :as => :profile
  get 'about/about' => 'about#about', :as => :about
  get 'modal/modal' => 'modal#modal', :as => :modal
  post 'register' => 'register#register'
  post 'login' => 'login#login'
  post 'data' => 'data#data'
  post 'measurements' => 'measurements#measurements'
  post 'target' => 'target#target'
  post 'activity' => 'activity#activity'
  post 'requisition/modifyRequisition' => 'requisition#modifyRequisition'
end
