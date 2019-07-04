Rails.application.routes.draw do
  root 'welcome#home'
  resources :dogs
  resources :clients
end
