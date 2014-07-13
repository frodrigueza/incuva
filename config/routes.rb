Incuba::Application.routes.draw do

  devise_for :members
  resources :grades

  resources :topics

  resources :articles

  resources :categories

  resources :contents

  get '/members/sign_in' => 'members#sign_up'
  
  get 'home/sessions' => 'home#sessions'
  get 'home/stads' => 'home#stads'
  get '/delete_item' => 'home#delete_item', as: :delete_item

  post '/topic_articles' => 'home#topic_articles', as: :topic_articles

  post '/create_notice' => 'home#create_notice'
  get '/delte_notice' => 'home#delete_notice'


  get '/delete_content' => 'home#delete_content'
  post '/upload_content' => 'home#upload_content'

  post '/site_categories' => 'home#site_categories', as: :site_categories
  get '/resource' => 'home#resource', as: :resource
  post '/grade_topics' => 'home#grade_topics', as: :grade_topics  

  get "home/index"
  get "/material" => 'home#material', as: :home_material
  get "/about_us" => 'home#about_us', as: :home_about_us
  get "/join_us" => 'home#join_us', as: :home_join_us
  get "/our_team" => 'home#our_team', as: :home_our_team
  get "/contact" => 'home#contact', as: :home_contact
  get "/members" => 'home#members', as: :home_members
  get "/welcome" => 'home#welcome', as: :home_welcome

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
