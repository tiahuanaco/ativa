Ativa::Application.routes.draw do
  devise_for :users
  root 'projects#index'

  resources :projects do
    resources :posts, except: :index
  end

  get 'users/:id' => 'users#show', as: 'user'
end
