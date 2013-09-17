PosDaily::Application.routes.draw do
  resources :merchants

  resources :ttts
  resources :my_trades

  devise_for :users
	root :to => 'my_trades#index'
  resources :users do
    post :add, :on => :collection
    patch :del_merchant, :on => :member
    patch :add_merchant, :on => :member

  end
  resources :trades do
    collection do
      post :import
      get :del
      get :submit
    end
  end
end
