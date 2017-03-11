Rails.application.routes.draw do
  resources 'cards', only: [:index, :create]

  root 'cards#index'
end
