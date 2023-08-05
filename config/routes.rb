Rails.application.routes.draw do
  get 'questions/ask'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'questions#home'

  get 'ask', to: 'questions#ask'
  get 'answer', to: 'questions#answer'
end
