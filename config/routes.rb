Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :agenda

  # resources :registrations
  resources :speakers, controller: 'speakers', type:'Speaker' do
      resources :projects
  end
  resources :attendees, controller: 'attendees', type:'Attendee'

  root to: "home#index"
  get '/welcome' => "welcome#index", as: :user_root
end
