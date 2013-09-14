PosDaily::Application.routes.draw do
  devise_for :users
	root :to => 'home#index'
  resources :trades do
    collection do
      post :import
      get :del
      get :submit
    end
  end
end
