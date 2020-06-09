Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pictures do
    resources :comments
    # this isn't ideal, as toggle doesn't really match to the
    # semantics of what the POST verb is supposed to do
    # however, it will do for now
    post '/likes' => 'likes#toggle'
  end

  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
end
