
class IssuesController < ActionController::Base
    
    def index
      @issues = Issue.all
    end

    def show
      @issue = Issue.find(params[:id])
    end
  
  
end