Rails.application.routes.draw do
  resources :kinds
  resources :contacts
  # get '/contacts', to: "contacts#index"
end
