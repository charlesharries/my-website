Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'work',        to: 'posts#work'
  get 'opinions',    to: 'posts#opinions'
  get 'experiments', to: 'posts#experiments'

  resources :posts
end
