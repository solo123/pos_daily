PosDaily::Application.routes.draw do
	root :to => 'home#index'
  resources :trades

end
