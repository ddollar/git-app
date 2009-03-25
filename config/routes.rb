ActionController::Routing::Routes.draw do |map|

  # clearance
  map.resource  :session
  map.resources :users, :has_one => [:password, :confirmation]
  map.resources :passwords

  # default route
  map.root :controller => 'home'

  # fallback routes, leave disabled
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'

end
