Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  get 'welcome/index'

  root 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
