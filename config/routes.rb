Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employees do
        resources :time_entries
      end
    end
  end
end
