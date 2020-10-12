Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :catalog
  resources :movie
=begin
  post 'catalog/:catalog_id/movie', to: 'movie#create'
=end
end
