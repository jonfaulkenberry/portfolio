Portfolio::Application.routes.draw do
  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.owner? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  resources :posts
  resources :projects
  
  root 'static_pages#index'
  get '/about' => 'static_pages#about', as: 'about'
  get '/blog' => 'posts#index', as: 'blog'
  match '/contact', to: 'static_pages#contact', as: 'contact', via: [:get, :post]
  get '/manage' => 'static_pages#manage', as: 'manage'
  get '/portfolio' => 'projects#index', as: 'portfolio'
  get '/search' => 'posts#search', as: 'search'
  get '/posts/by-month/:month/:year' => 'posts#posts_by_month'
  get '/posts/tags/:tag' => 'posts#tags', as: 'post_tag'
  get '/projects/tags/:tag' => 'projects#tags', as: 'project_tag'
  
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
    
  devise_scope :user do
      get "/login" => "devise/sessions#new"
      get "/logout" => "devise/sessions#destroy"
  end
end
