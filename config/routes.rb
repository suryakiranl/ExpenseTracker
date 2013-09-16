TestApp1::Application.routes.draw do

  resources :expenses

  resources :expensetypes

  # Navigation rules for Index and Home pages
  match "static_index" => 'static#index'
  match "static_home" => 'static#home'

  # Redirect the home page to a static site index page.
  root :to => 'static#index'
end
