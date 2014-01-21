Incuba::Application.routes.draw do

  devise_for :members
  devise_for :users
  resources :grades

  resources :topics

  resources :articles

  resources :categories

  get 'members/sign_in' => 'members#sign_up'
  
  get 'home/sessions' => 'home#sessions'
  get '/delete_item' => 'home#delete_item', as: :delete_item

  post '/topic_articles' => 'home#topic_articles', as: :topic_articles

  get '/delete_content' => 'home#delete_content'
  post '/upload_content' => 'home#upload_content'

  post '/site_categories' => 'home#site_categories', as: :site_categories
  get '/resource' => 'home#resource', as: :resource
  post '/grade_topics' => 'home#grade_topics', as: :grade_topics  

  get "home/index"

  root 'home#index'

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
