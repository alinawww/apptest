Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :speakers, controller: 'speakers', type:'Speaker', only: [:index, :show]
  resources :attendees, controller: 'attendees', type:'Attendee', only: [:index, :show]
  resources :agenda, only: :index
  # resources :registrations

  resources :users do
      resources :projects do
        resources :ratings
      end

  end
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
    member do
      post :mark_as_read
    end
    member do
      post :restore
    end
    collection do
      delete :empty_trash
    end
  end
  get '/projects', to: 'projects#index'



  resources :messages, only: [:new, :create]

  get 'tags/:tag', to: 'projects#index', as: :tag
  root to: "home#index"
  get '/welcome' => "welcome#index", as: :user_root
end
