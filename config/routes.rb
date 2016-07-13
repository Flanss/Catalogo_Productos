Rails.application.routes.draw do
  resources :marcas
  resources :productos
  root 'welcome#index'
end
