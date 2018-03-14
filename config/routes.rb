Rails.application.routes.draw do
  get 'messages' => 'messages#index', as: :messages
  post 'messages' => 'messages#create'

  get 'login' => 'sessions#new', as: :new_sessions
  post 'login' => 'sessions#create', as: :sessions
  delete 'logout' => 'sessions#destroy', as: :session

  get 'signup' => 'registrations#new', as: :new_registrations
  post 'signup' => 'registrations#create', as: :registrations

  root to: 'messages#index'
end
