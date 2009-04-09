ActionController::Routing::Routes.draw do |map|

  map.resource  :sessions, :only => [ :create, :destroy ]

  map.resources :repositories do |repository|
    repository.resources :blobs,   :only => [ :show         ]
    repository.resources :commits, :only => [ :index, :show ]
    repository.resources :trees,   :only => [ :index, :show ], :requirements => { :id => /.*/ }
  end

  map.resources :pages
  map.resource  :settings
  map.resources :users

  # default route
  map.root :controller => 'repositories'

  # fallback routes, leave disabled
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'

end
