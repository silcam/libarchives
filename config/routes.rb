Rails.application.routes.draw do
  root 'archives#home'
  get '/login', to: 'login#login_form'
  post '/login', to: 'login#login'
  get '/logout', to: 'login#logout'
  # resources :sent_bibliographies
  resources :archives do
    collection do
      get 'labels'
      post 'labels', to: 'archives#generate_labels'
    end
  end
  # resources :subcategories
  # resources :bibliography_styles
  # resources :fields
  resources :authors
  # resources :destinations
  resources :languages
  # resources :countries
  # resources :categories
  # resources :document_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
