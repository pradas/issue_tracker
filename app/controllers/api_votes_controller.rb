class ApiVotesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate, only: [:create, :destroy]
  
  def create
    if IssueVote.where(user_id: current_user.id, issue_id: params[:issue_id]).first != nil
      render :json => {:error => "user already voted"}, :status => 409
    else
      @issue_vote = IssueVote.new()
      @issue_vote.issue_id = params[:issue_id]
      @issue_vote.user_id = current_user.id
  
      if @issue_vote.save
        msg = { :message => "Success!", :user_id => current_user.id, :issue_id => params[:issue_id] }
        render :json => msg, :status => 201
      else
        render :json => {:error => "Params bad specified"}, :status => 400
      end
    end
  end
  
end
