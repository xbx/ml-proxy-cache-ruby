Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/items/:id', controller: 'items', action: 'get_item'
  get '/items', controller: 'items', action: 'all'

  get '/wall', controller: 'walls', action: 'index'
end
