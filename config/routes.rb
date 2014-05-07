Portfolio::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks"  }
  resources :posts
  resources :projects

  root 'welcome#index'
  get '/about' => 'welcome#about', as: 'about'
  get '/blog' => 'posts#index', as: 'blog'
  match '/contact', to: 'welcome#contact', as: 'contact', via: [:get, :post]
  get '/manage' => 'welcome#manage', as: 'manage'
  get '/portfolio' => 'projects#index', as: 'portfolio'
  get '/search' => 'welcome#search', as: 'search'
  devise_scope :user do
      get "/login" => "devise/sessions#new"
      get "/logout" => "devise/sessions#destroy"
  end
end
