Rails.application.routes.draw do
  


  resources :orders do
     member do
    get :setting
    end
  end
  resources :line_items
  resources :carts
  resources :users
  controller :sessions do
  	get 'login' => :new
  	post 'login' => :create
  	delete 'logout' => :destroy
  end

  resources :providers
  resources :categories
  resources :products do
    member do
      patch 'star'
      put 'star'
    end
  end
  root 'useless_welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
