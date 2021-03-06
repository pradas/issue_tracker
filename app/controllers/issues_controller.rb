class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /issues
  # GET /issues.json
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
    @issue_votes = IssueVote.order(created_at: :desc)
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @comments = Comment.where(issue_id: set_issue).order(created_at: :desc)
    @comment = Comment.new
    @resumes = Resume.where(issue_id: set_issue).order(created_at: :desc)
    @resume = Resume.new
    @issue_votes = IssueVote.where(issue_id: set_issue).order(created_at: :desc)
    @issue_vote = IssueVote.new
    if current_user!= nil
      @user_vote = IssueVote.where(user_id: current_user.id, issue_id: set_issue).first
    end
    @issue_watches = IssueWatch.where(issue_id: set_issue).order(created_at: :desc)
    @issue_watch = IssueWatch.new
    if current_user!= nil
      @user_watch = IssueWatch.where(user_id: current_user.id, issue_id: set_issue).first
    end
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :description, :user_id, :status,:kind, :priority, :votes, :watchers)
    end
     private
  
    def sort_column
      Issue.column_names.include?(params[:sort]) ? params[:sort] : "Title"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
