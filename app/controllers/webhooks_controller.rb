
class WebhooksController < ActionController::Base
    
    def index
      render json: { data: "sucesso" }
    end

    # Handle push event
    def push(payload)
      # TODO: handle push webhook
    end
  
    # Handle create event
    def create(payload)
      # TODO: handle create webhook
    end
  
    private
  
    def webhook_secret(payload)
      ENV['WEBHOOK_SECRET']
    end
end