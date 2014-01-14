Medicine::Application.routes.draw do
  
  get "contact/index"

  resources :permissiongroups


  resources :permissions
  resources :certifiedspecialities
  resources :cvs
  resources :affiliateresearchareas
  resources :researchareas
  resources :fellowships
  resources :residencies
  resources :degrees
  resources :institutions
  resources :licenses
  resources :affiliates
  resources :usertypes
  resources :users
  resources :affiliates
  resources :hospitalprivileges
  resources :hospitals
  resources :languages
  resources :affiliatelanguages



  match '/faq',    to: 'static_pages#faq'
  match '/home',   to: 'static_pages#home'
  match '/admin',   to: 'static_pages#admin'

  get '/search',  to: 'affiliates#search'
  post '/doSearch', to: 'affiliates#doSearch'

  get 'search/update_section_select/:id', to: 'affiliates#update_section_select'
  #match 'search/update_city_select/:id',  to: 'affiliates#update_city_select'

  match 'contactus', to: 'contact#index'
  match 'sendcontact', to: 'contact#sendcontact'

  root :to => 'static_pages#home'

  match '*unmatched_route', :to => 'application#raise_not_found!'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
