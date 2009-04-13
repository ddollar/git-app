ActionController::Routing::Routes.draw do |map|

  map.resource  :sessions, :only => [ :create, :destroy ]

  map.resources :repositories do |repository|
    repository.resources :commits do |commits|
      commits.resources :files, :requirements => { :id => /.*/ }
    end
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
