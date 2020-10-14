Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :destroy]
  resources :events, only: [:new, :create, :show, :index]
  post 'events/:id/rsvp', to: 'attendances#create'
  root 'events#index'
end
