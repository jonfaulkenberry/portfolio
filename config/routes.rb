Portfolio::Application.routes.draw do
  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.owner? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  resources :posts
  resources :projects
  
  root 'welcome#index'
  get '/about' => 'welcome#about', as: 'about'
  get '/blog' => 'posts#index', as: 'blog'
  match '/contact', to: 'welcome#contact', as: 'contact', via: [:get, :post]
  get '/manage' => 'welcome#manage', as: 'manage'
  get '/portfolio' => 'projects#index', as: 'portfolio'
  get '/search' => 'posts#search', as: 'search'
  get '/posts/by-month/:month/:year' => 'posts#posts_by_month'
  
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
    
  devise_scope :user do
      get "/login" => "devise/sessions#new"
      get "/logout" => "devise/sessions#destroy"
  end
end
