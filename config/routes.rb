Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :posts
  resources :posts do
    resources :comments
  end
  # Using a symbol (:username) to enable dynamic parameter, since usernames change
  get ':username', to: 'profiles#show', as: :profile
  get ':username/edit', to: 'profiles#edit', as: :edit_profile
end

