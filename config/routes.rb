Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :posts
  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end
  # Using a symbol (:username) to enable dynamic parameter, since usernames change
  # HTTP Verb, path, controller#action, helper 
  get ':username', to: 'profiles#show', as: :profile
  get ':username/edit', to: 'profiles#edit', as: :edit_profile
  patch ':username/edit', to: 'profiles#update', as: :update_profile
end

