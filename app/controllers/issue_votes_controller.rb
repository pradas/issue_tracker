class IssueVotesController < ApplicationController
  before_action :set_issue_vote, only: [:show, :edit, :update, :destroy]

  # GET /issue_votes
  # GET /issue_votes.json
  def index
    @issue_votes = IssueVote.all
  end

  # GET /issue_votes/1
  # GET /issue_votes/1.json
  def show
  end

  # GET /issue_votes/new
  def new
    @issue_vote = IssueVote.new
  end

  # GET /issue_votes/1/edit
  def edit
  end

  # POST /issue_votes
  # POST /issue_votes.json
  def create
    @issue_vote = IssueVote.new(issue_vote_params)
    @issue_vote.issue = params[:issue_id]
    @issue_vote.user = current_user.id

    respond_to do |format|
      if @issue_vote.save
        format.html { redirect_to @issue_vote, notice: 'Issue vote was successfully created.' }
        format.json { render :show, status: :created, location: @issue_vote }
      else
        format.html { render :new }
        format.json { render json: @issue_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_votes/1
  # PATCH/PUT /issue_votes/1.json
  def update
    respond_to do |format|
      if @issue_vote.update(issue_vote_params)
        format.html { redirect_to @issue_vote, notice: 'Issue vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_vote }
      else
        format.html { render :edit }
        format.json { render json: @issue_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_votes/1
  # DELETE /issue_votes/1.json
  def destroy
    @issue_vote.destroy
    respond_to do |format|
      format.html { redirect_to issue_votes_url, notice: 'Issue vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_vote
      @issue_vote = IssueVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_vote_params
      params.require(:issue_vote).permit(:user, :issue)
    end
end
