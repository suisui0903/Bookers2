Rails.application.routes.draw do
  get 'home/about' =>'homes#about'
  get 'users' => 'users#index'
  devise_for :users, controllers: {
        sessions:      'users/sessions',
        passwords:     'users/passwords',
        registrations: 'users/registrations'
    }
  root :to => "homes#top"
  get '' => 'homes#top'
  resources :users, only: [:show, :update, :edit, :index]
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
