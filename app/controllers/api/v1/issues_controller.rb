
class Api::V1::IssuesController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token

    def index
      issues = Issue.all.order(:created_at)
      render json: issues.to_json(:only => [
        :id, 
        :action,
        :repository_id,
        :repository_name,
        :owner_name,
        :created_at,
        :updated_at
      ])
    end

    def create
      push = JSON.parse(request.body.read)
      data = parse_to_issue(push)
      status_code = data.save ? 201 : 400
      render json: { data: "#{data.to_json}", status: status_code }, status: status_code
    end

    def show
      issue = Issue.find(params[:id])
      render json: issue.to_json
    end

    private
  
    def parse_to_issue(push)
      issue = Issue.new(
        issue_id: push["issue"]["id"].to_i,
        action: "#{push["action"]}",
        repository_id: push["repository"]["id"].to_i,
        repository_name: "#{push["repository"]["name"]}",
        owner_name: "#{push["repository"]["owner"]["login"]}",
        created_at: "#{push["issue"]["created_at"]}",
        updated_at: "#{push["issue"]["updated_at"]}",
        title: "#{push["issue"]["title"]}"
      )  
    end
  
 end
 