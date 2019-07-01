Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'dogs/new', to: 'dogs#new'
  get 'dogs/index', to: 'dogs#index'
  get 'dogs/:id/show', to: 'dogs#show', as: :dog_show
  post '/dogs', to: 'dogs#create'
  delete 'dogs/:id/delete', to: 'dogs#delete', as: :dog_delete
  get 'dogs/:id/edit', to: 'dogs#edit', as: :dog_edit
  patch 'dogs/:id/update', to: 'dogs#update', as: :dog_update

end
