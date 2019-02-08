Rails.application.routes.draw do
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :issues do
        member do
          get 'show'
        end
        collection do
          get 'index'
          post 'create'
        end
      end
    end
  end
  
  resources :issues
  
  root 'issues#index'
  
end