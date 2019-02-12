Rails.application.routes.draw do
  resources :contacts
  # get '/contacts', to: "contacts#index"
end
