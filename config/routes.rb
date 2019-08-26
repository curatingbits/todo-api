Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :todos
      resources :projects
      resources :users, only: :create do

        collection do
          # email confirmation logic
          # post 'confirm'
          post 'login'
        end
      end
    end
  end
end
