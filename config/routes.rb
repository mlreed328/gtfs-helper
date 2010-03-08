ActionController::Routing::Routes.draw do |map|
  map.resource :uploads, :only => [:new, :create]
  map.root :controller => 'home', :action => 'index'
end
