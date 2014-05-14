Portfolio::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks"  }
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
  devise_scope :user do
      get "/login" => "devise/sessions#new"
      get "/logout" => "devise/sessions#destroy"
  end
end
