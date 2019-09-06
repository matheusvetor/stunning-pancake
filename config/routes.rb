Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employees do
        resources :time_entries
      end
    end
  end

  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  delete 'signin', controller: :signin, action: :destroy
end
