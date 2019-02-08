Rails.application.routes.draw do
  post '/callback', to: 'webhooks#callback', constraints: { format: 'json' }
  get '/', to: 'webhooks#index'
  get 'webhook', to: 'webhook#webhook'
end