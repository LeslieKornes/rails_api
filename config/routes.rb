Rails.application.routes.draw do
  
  # explicit and basic
  # get '/articles', to: 'articles#index'

  # by default gives us all CRUD routes out of the box (before `only`)
  resources :articles, only: [:index, :show]

end
