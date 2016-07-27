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

  get 'tags/:tag', to: 'projects#index', as: :tag
  root to: "home#index"
  get '/welcome' => "welcome#index", as: :user_root
end
