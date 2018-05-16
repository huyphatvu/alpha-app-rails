Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#myIndex'

  get '/welcome/about', to: 'welcome#about'
  resources :articles
end
