Rails.application.routes.draw do

  resources :tasks, only: [:index]
  resources :import_tasks, only: [:index, :new, :create]
  resources :export_tasks, only: [:index]
  root 'tasks#index'

end
