Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'drafts',      to: 'posts#drafts'
  get 'blog',        to: 'posts#index'
  get 'contact',     to: 'static_pages#contact'
  get 'resume',      to: 'static_pages#resume'

  get 'sitemap.xml', to: redirect('https://s3.amazonaws.com/charlesharriesblog/sitemaps/sitemap.xml')

  get 'posts/:id',   constraints: { id: /[0-9]+/ }, to: redirect('posts', status: 301)
  devise_scope :user do
    get 'login',     to: 'devise/sessions#new'
  end

  resources :posts, param: :slug
end
