Auto::Application.routes.draw do
  get "pages/index"
   get "products/stad", to: "products#stad"

  resources :brands

  resources :products do
    get :autocomplete_brand_name, :on => :collection
  end

   root :to => 'pages#index'
  
end
