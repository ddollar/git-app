ActionController::Routing::Routes.draw do |map|

  map.resources :sessions, :only => [ :create, :destroy ]

  map.resources :repositories
  map.resources :pages
  map.resources :users

  # default route
  map.root :controller => 'repositories'

  # fallback routes, leave disabled
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'

end
