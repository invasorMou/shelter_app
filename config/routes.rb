Rails.application.routes.draw do
  devise_for :clients
  root 'welcome#home'
  resources :dogs
  resources :clients
end
