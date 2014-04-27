Portfolio::Application.routes.draw do
  get "comments/index"
  get "comments/new"
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks"  }
  resources :posts do
    resources :comments
  end
  resources :projects do
    resources :comments
  end

  root 'welcome#index'
  get '/about' => 'welcome#about', as: 'about'
  get '/blog' => 'posts#index', as: 'blog'
  get '/contact' => 'welcome#contact', as: 'contact'
  get '/manage' => 'welcome#manage', as: 'manage'
  get '/portfolio' => 'projects#index', as: 'portfolio'
  get '/search' => 'welcome#search', as: 'search'
  devise_scope :user do
      get "/login" => "devise/sessions#new"
      get "/logout" => "devise/sessions#destroy"
  end
end
