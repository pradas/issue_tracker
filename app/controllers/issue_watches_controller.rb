class IssueWatchesController < ApplicationController
  before_action :set_issue_watch, only: [:show, :edit, :update, :destroy]

  # GET /issue_watches
  # GET /issue_watches.json
  def index
    @issue_watches = IssueWatch.all
  end

  # GET /issue_watches/1
  # GET /issue_watches/1.json
  def show
  end

  # GET /issue_watches/new
  def new
    @issue_watch = IssueWatch.new
  end

  # GET /issue_watches/1/edit
  def edit
  end

  # POST /issue_watches
  # POST /issue_watches.json
  def create
    if IssueWatch.where(user_id: current_user.id, issue_id: params[:issue_id]).first != nil
      IssueWatch.where(user_id: current_user.id, issue_id: params[:issue_id]).first.destroy
      redirect_to Issue.find(params[:issue_id])
    else
      @issue_watch = IssueWatch.new()
      @issue_watch.issue_id = params[:issue_id]
      @issue_watch.user_id = current_user.id
  
      respond_to do |format|
        if @issue_watch.save
          format.html { redirect_to Issue.find(params[:issue_id]) }
          #format.json { render :show, status: :created, location: @issue_watch }
        else
          format.html { render :new }
          #format.json { render json: @issue_watch.errors, status: :unprocessable_entity }
        end
      end 
    end
  end

  # PATCH/PUT /issue_watches/1
  # PATCH/PUT /issue_watches/1.json
  def update
    respond_to do |format|
      if @issue_watch.update(issue_watch_params)
        format.html { redirect_to @issue_watch, notice: 'Issue watch was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_watch }
      else
        format.html { render :edit }
        format.json { render json: @issue_watch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_watches/1
  # DELETE /issue_watches/1.json
  def destroy
    @issue_watch.destroy
    respond_to do |format|
      format.html { redirect_to issue_watches_url, notice: 'Issue watch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_watch
      @issue_watch = IssueWatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_watch_params
      params.require(:issue_watch).permit(:user, :issue)
    end
end
