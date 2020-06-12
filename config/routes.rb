Rails.application.routes.draw do
  get 'clock/index'
  root 'clock#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
