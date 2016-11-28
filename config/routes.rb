TODOAppV3::Application.routes.draw do
  resources :users 
  resources :todos 
  
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'welcome_pages#index'
  match 'welcome', to: 'todos#index'
  match 'show_all_users', to: 'users#show_all_users'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/show_open_tasks', to: 'todos#show_open_tasks'
  match '/show_done_tasks', to: 'todos#show_done_tasks'
  match '/show_archive_tasks', to: 'todos#show_archive_tasks'
  get '/show_priority_tasks', to: 'todos#show_priority_tasks', as: :show_priority_tasks
  get '/todos/:id/move_to_open_tasks', to: 'todos#move_to_open_tasks', as: :move_to_open_tasks
  get '/todos/:id/move_to_archive', to: 'todos#move_to_archive', as: :move_to_archive
  get '/todos/:id/mark_as_done', to: 'todos#mark_as_done', as: :mark_as_done
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
