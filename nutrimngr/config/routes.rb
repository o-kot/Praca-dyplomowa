Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'index#index'
  get 'index/index'  
  get 'modal/modal' => 'modal#modal', :as => :modal
  post 'register' => 'register#register'
  post 'login' => 'login#login'
end
