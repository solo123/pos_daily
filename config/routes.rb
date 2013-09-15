PosDaily::Application.routes.draw do
  resources :ttts

  devise_for :users
	root :to => 'home#index'
  resources :users
  resources :trades do
    collection do
      post :import
      get :del
      get :submit
    end
  end
end
