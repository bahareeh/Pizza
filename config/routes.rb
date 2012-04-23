ActionController::Routing::Routes.draw do |map|

  map.logout '/admin/logout', :controller => 'admin/sessions', :action => 'destroy'
  map.login '/admin/login', :controller => 'admin/sessions', :action => 'new'
  map.admin '/admin', :controller => 'admin/admin', :action => 'index'

  map.connect 'about/news', :controller => 'about', :action => 'news_recent'
  map.about_news_archive 'about/news/archive', :controller => 'about', :action => 'news_archive'
  map.connect 'about/news/archive.:format', :controller => 'about', :action => 'news_archive'
  map.about_news_tag 'about/news/tag/:tag', :controller => 'about', :action => 'news_tagged'
  map.about_news_view 'about/news/:id', :controller => 'about', :action => 'news_view'
  
  map.connect 'about/gift-cards', :controller => 'about', :action => 'gift_cards'

  map.connect 'menu', :controller => 'menu', :action => 'index'
  map.menu_category 'menu/:category', :controller => 'menu', :action => 'category'
  map.menu_subcategory 'menu/:category/:subcategory', :controller => 'menu', :action => 'subcategory'
  
  # fixing common 404s with redirects
  map.redirect '%22', '/', :permament => true
  map.redirect 'offers/%22', '/offers', :permament => true
  map.redirect 'locations/%22', '/locations', :permament => true
  map.redirect 'contact/', '/about/contact', :permament => true
  map.redirect 'media/pdf/pizzatown-menu.pdf', '/menu', :permament => true
  map.redirect 'media/pdf/pizzatown-coupons.pdf', '/offers', :permament => true
  map.redirect 'menu/pastas', '/menu', :permament => true
  map.redirect 'menu/appetizers', '/menu', :permament => true

  map.namespace(:admin) do |admin|
    admin.resource :session
    admin.resources :posts, :member => 'delete_attachment'
    admin.resources :slides, :member => 'delete_attachment'
    admin.resources :categories do |category|
      category.resources :items, :member => 'delete_attachment'
    end
    admin.resources :callouts, :member => 'delete_attachment'
  end

  map.connect "sitemap.xml", :controller => "home", :action => "sitemap", :format => 'xml'

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
  map.root :controller => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end