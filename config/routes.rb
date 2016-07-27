Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :speakers, controller: 'speakers', type:'Speaker', only: [:index, :show]
  resources :attendees, controller: 'attendees', type:'Attendee', only: [:index, :show]
  resources :agenda, only: :index
  # resources :registrations
  resources :users do
      resources :projects
  end
  resources :conversations, only: [:index, :show, :destroy]
  resources :messages, only: [:new, :create]
  get 'tags/:tag', to: 'projects#index', as: :tag
  root to: "home#index"
  get '/welcome' => "welcome#index", as: :user_root
end
