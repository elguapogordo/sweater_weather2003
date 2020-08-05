Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :background, only: [:index]
      resources :forecast, only: [:index]
      resources :sessions, only: [:create]
      resources :trails, only: [:index]
      resources :users, only: [:create]
    end
  end
end
