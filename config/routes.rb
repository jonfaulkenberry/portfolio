Portfolio::Application.routes.draw do
  devise_for :users
  resources :posts
  resources :projects

  root 'welcome#index'
  get '/about' => 'welcome#about', as: 'about'
  get '/blog' => 'posts#index', as: 'blog'
  get '/contact' => 'welcome#contact', as: 'contact'
  get '/manage' => 'welcome#manage', as: 'manage'
  get '/portfolio' => 'projects#index', as: 'portfolio'
  get '/search' => 'welcome#search', as: 'search' 
end
