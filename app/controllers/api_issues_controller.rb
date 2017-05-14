class ApiIssuesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate, only: [:create]
  
  def index
    @issues = Issue.all
    render status: :ok, file: "api/issues/index.json.jbuilder"
  end
  
  def create
    @issue = Issue.new()
    @issue.title = params[:title]
    @issue.description = params[:description]
    @issue.user_id = params[:user_id]
    @issue.kind = params[:kind]
    @issue.priority = params[:priority]
    @issue.status = "new"
    @issue.votes = 0
    @issue.watchers = 0

    if @issue.save
      msg = { :message => "Success!", :id => @issue.id, :title => @issue.title }
      render :json => msg, :status => 201
    else
      render :json => { :error => "Missing parameters." }, :status => 400
    end
  end
  
  def show
    if (Issue.where(id: params[:issue_id]).exists?)
      @issue = Issue.find(params[:issue_id])
      render status: :ok, file: "api/issues/show.json.jbuilder"
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
end
