PosDaily::Application.routes.draw do
  devise_for :users
	root :to => 'home#index'
  resources :trades do
    post :import, :on => :collection
  end
end
