Rails.application.routes.draw do
  root 'site#home'
  get '/concerts/price' => 'concerts#price'
  post '/concerts/price_send' => 'concerts#price'
  get '/concerts/popular' => 'concerts#popular'
  #[:home, :index, :show, :new, :create, :destroy]
  resources :cities, only:[:index, :new,:create] do
    resources :concerts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
    end
  end
end
