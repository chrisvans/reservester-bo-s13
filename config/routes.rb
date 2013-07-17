Reservester::Application.routes.draw do
  devise_for :owners

  get '/dashboard', to: 'owners#dashboard'

  resources :owners do 
    resources :restaurants, :only => [:new, :create, :edit, :update, :show]
  end

  resources :restaurants, :except => [:new, :create] do 
    resources :reservations, :only => [:new, :create]
  end

  resources :reservations, :except => [:new, :create]

  root to: "welcome#index"

end
