Rails.application.routes.draw do
  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/notes/:id/info",to: "notes#info"
  post "/api",to: "notes#create"
end
