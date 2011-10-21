ActionController::Routing::Routes.draw do |map|
  map.resources :bp_triples

  map.resources :bp_properties

  map.resources :bp_terms

  map.resources :bp_ontologies

  map.resources :ordinal_levels

  map.resources :lexicon_terms, :member => { :search => :get }

  map.resources :quantiles

  map.resources :scales

  map.resources :calculations

  map.resources :inferences

  map.resources :components, :member => {:copy => :get, :aim_class => :get }

  map.resources :numericals

  map.resources :intervals

  map.resources :non_quantifiables

  map.resources :characteristic_quantifications, :member => {:update_type => :get, :delete_quantifiables => :get }

  map.resources :allowed_terms

  map.resources :allowed_terms

  map.resources :allowed_terms

  map.resources :template_containers, :member => {:remove_included_template => :get, :copy => :get, :included_templates => :get, :update_included_templates => :post}

  map.resources :aim_templates, :member => {:copy => :get}

  map.resources :imaging_observations

  map.resources :imaging_observation_characteristics

  map.resources :anatomic_entities

  map.resources :anatomic_entity_characteristics

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "user_sessions", :action => "new"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
#  map.resource :account, :controller => "users"
#  map.resources :users
  # map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users
  #  map.resource :template_store, :controller => :template_stores
  map.resource :user_session
  # map.resources 
  # map.root :controller => "user_sessions", :action => "new"
  # map.root :controller => "template_stores", :action => "index"
  map.root :controller => "main", :action => "index"
  # match 'template_containers/included_templates' => 'template_conatiners#included_templates'
end
