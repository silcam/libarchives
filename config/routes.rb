Rails.application.routes.draw do
  resources :sent_bibliographies
  resources :archives
  resources :subcategories
  resources :bibliography_styles
  resources :fields
  resources :authors
  resources :destinations
  resources :languages
  resources :countries
  resources :categories
  resources :document_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
