Rails.application.routes.draw do
  resources :viewers
  resources :articles do
    resources :comments
  end

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

  get "/accounts/addt/" ,to: "accounts#addt" , as: :new_addt

  post "/accounts/create/" ,to: "accounts_creator#create" , as:  "create_account"
  get "/accounts/new/" ,to: "accounts_creator#new" , as: :new_account
  
  get "/account_cover/:id" , to: 'accounts#image', as: :see_account_image  
  resources :accounts, except: [ :new , :create, :destroy ]
  
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users
  #get "/devise" , to: 'sessions#new'
  #get "/blog" , to: 'articles#blog'
  root 'backend#index'
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
  get "/crashes/not_found" ,to: "crashes#when_render_not_found" , as: :rnf
  get '*unmatched_route', :to => 'application#render_not_found'
end
