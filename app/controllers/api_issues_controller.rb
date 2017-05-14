class ApiIssuesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate, only: [:create, :update, :destroy]
  helper_method :sort_column, :sort_direction

  
  def index
    if params[:responsible] != nil
      @issues =Issue.where(["user_id = ?",params[:responsible]]).order(sort_column+" "+sort_direction)
    else
      @issues = Issue.order(sort_column+" "+sort_direction)
    end 
    if params[:kind] != nil
      @issues = @issues.where(["kind = ?",params[:kind]]).order(sort_column+" "+sort_direction)
    end
    if params[:status] != nil
      @issues = @issues.where(["status = ? or status = ?",params[:status],params[:status2]]).order(sort_column+" "+sort_direction)
    end
    if params[:priority] != nil
      @issues = @issues.where(["priority = ?",params[:priority]]).order(sort_column+" "+sort_direction)
    end
    
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
      msg = { :message => "Issue created", :id => @issue.id, :title => @issue.title }
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
  
  def update
    if (Issue.where(id: params[:issue_id]).exists?)
      @issue = Issue.find(params[:issue_id])
      
      if (params[:title] != nil)
        @issue.title = params[:title]
      end
      if (params[:description] != nil)
        @issue.description = params[:description]
      end
      if (params[:user_id] != nil)
        @issue.user_id = params[:user_id]
      end
      if (params[:kind] != nil)
        @issue.kind = params[:kind]
      end
      if (params[:priority] != nil)
        @issue.priority = params[:priority]
      end
      if (params[:status] != nil)
        @issue.status = params[:status]
      end

      if @issue.save
        msg = { :message => "Issue edited!", :id => @issue.id, :title => @issue.title }
        render :json => msg, :status => 200
      else
        render :json => {:error => "Params bad specified"}, :status => 400
      end
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
  
  def destroy
    if (Issue.where(id: params[:issue_id]).exists?)
      Issue.destroy(params[:issue_id])
      render :json => {:message => "Issue deleted"}, :status => 200
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
  
  private
    def sort_column
      Issue.column_names.include?(params[:sort]) ? params[:sort] : "Title"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
