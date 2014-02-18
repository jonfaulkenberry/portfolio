Portfolio::Application.routes.draw do
  devise_for :users
  resources :posts
  resources :projects

  root 'welcome#index'
  get '/contact' => 'welcome#contact', as: 'contact'
  get '/portfolio' => 'projects#index', as: 'portfolio' 
  get '/blog' => 'posts#index', as: 'blog'
  get '/manage' => 'welcome#manage', as: 'manage'
end
