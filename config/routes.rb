Rails.application.routes.draw do
  devise_for :users
  resources :characters
  resources :character_attributes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'
end
