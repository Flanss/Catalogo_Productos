Rails.application.routes.draw do
  resources :marcas

  root 'welcome#index'
end
