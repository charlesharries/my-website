Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'drafts',      to: 'posts#drafts'
  get 'work',        to: 'posts#work'
  get 'opinions',    to: 'posts#opinions'
  get 'experiments', to: 'posts#experiments'
  get 'contact',     to: 'static_pages#contact'

  devise_scope :user do
    get 'login',     to: 'devise/sessions#new'
  end

  resources :posts
end
