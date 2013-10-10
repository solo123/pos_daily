PosDaily::Application.routes.draw do
  devise_for :users
	root :to => 'my_trades#index'

  resources :merchants
  resources :ttts
  resources :my_trades
	resources :clients do
    patch :del_merchant, :on => :member
    patch :add_merchant, :on => :member
	end

  resources :users do
    post :add, :on => :collection
    patch :del_agent_merchant, :on => :member
    patch :add_agent_merchant, :on => :member
		get :mock, :on => :member
  end

  resources :trades do
    collection do
      post :import
      get :del
      get :submit
    end
  end

	resources :reports do
		collection do
			get :monthly
			get :daily
		end
	end
end
