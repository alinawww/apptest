Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :agenda
  resources :projects
  resources :speakers, controller: 'speakers', type:'Speaker'
  resources :attendees, controller: 'attendees', type:'Attendee'
  root to: "home#index"
end

#
# # config/routes.rb
# resources :animals
# resources :lions, controller: 'animals', type: 'Lion'
# resources :meerkats, controller: 'animals', type: 'Meerkat'
# resources :wild_boars, controller: 'animals', type: 'WildBoar'
#
# root 'animals#index'
