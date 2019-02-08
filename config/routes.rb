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
  
  post '/payload', to: 'webhooks#payload', constraints: { format: 'json' }
  get '/', to: 'webhooks#index'
  get 'webhook', to: 'webhook#webhook'

end