Rails.application.routes.draw do
  
  devise_for :users
root 'welcome#index'

resources :users, only: [:index, :show] do
	resources :episodes
end
  
end
