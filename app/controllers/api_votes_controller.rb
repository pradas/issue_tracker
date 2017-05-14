class ApiVotesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate, only: [:create, :destroy]
  
  def create
    if IssueVote.where(user_id: current_user.id, issue_id: params[:issue_id]).exists?
      render :json => {:error => "user already voted"}, :status => 409
    else
      @issue_vote = IssueVote.new()
      @issue_vote.issue_id = params[:issue_id]
      @issue_vote.user_id = current_user.id
  
      if @issue_vote.save
        msg = { :message => "Voted for a issue", :user_id => current_user.id, :issue_id => params[:issue_id] }
        render :json => msg, :status => 201
      else
        render :json => {:error => "Params bad specified"}, :status => 400
      end
    end
  end
  
  def destroy
    if IssueVote.where(user_id: current_user.id, issue_id: params[:issue_id]).exists?
      IssueVote.where(user_id: current_user.id, issue_id: params[:issue_id]).first.destroy
      render :json => {:message => "Vote deleted"}, :status => 200
    else
      render :json => { :error => "user didn't voted for this issue" }, :status => 409
    end
  end
  
end
