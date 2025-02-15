Rails.application.routes.draw do
  
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
    #:sessions => 'users/sessions'   
  } 

  devise_scope :user do
    #get "sign_in", :to => "users/sessions#new"
    #get "sign_out", :to => "users/sessions#destroy" 
  end  
  #resources :articles, only: [:show,:create,:edit,:destroy,:new]  do
  resources :u, only: [:index, :show] do
    scope module: :u do
      resources :articles, only: [:index, :show]
    end
  end
  resources :articles, only: [:index,:show,:create,:edit,:update,:destroy,:new]  do
    member do
      get :liking_users
      post :publish
      post :draft
    end
  end

  resources :users,param: :name ,except: :edit do
    member do
      get :like_articles
    end
  end
  namespace :settings do
    resource :profiles
    resource :accounts
    resource :passwords
  end
  post '/like/:article_id' => 'likes#like', as: 'like'
  delete '/unlike/:article_id' => 'likes#unlike', as: 'unlike'
  
  get 'signup' => 'users#new'
  get 'allranking' => "articles#allranking"
  
  get "cfashion" => "articles#cfashion"
  get "cbeauty" => "articles#cbeauty"
  get "clifestyle" => "articles#clifestyle"
  get "cgourmet" => "articles#cgourmet"
  get "changout" => "articles#changout"
  get "centertainment" => "articles#centertainment"
  get "cstudy" => "articles#cstudy"
  get "citem" => "articles#citem"
  get "cfunny" => "articles#cfunny"
  get "cothers" => "articles#cothers"
  root 'static_pages#home'
  
  get   'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  #resources :microposts,          only: [:create, :destroy]
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
