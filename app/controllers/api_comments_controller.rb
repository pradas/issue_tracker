class ApiCommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate, only: [:create, :update, :destroy]
  
  def index
    if (Issue.where(id: params[:issue_id]).exists?)
      @comments = Comment.where(issue_id: params[:issue_id])
      render status: :ok, file: "api/comments/index.json.jbuilder"
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
  
  def create
    if (Issue.where(id: params[:issue_id]).exists?)
      @comment = Comment.new()
      @comment.content = params[:text]
      @comment.pin = false
      @comment.spam = false
      @comment.issue_id = params[:issue_id]
      @comment.user_id = current_user.id

      if @comment.save
        msg = { :message => "Comment created", :id => @comment.id, :text => @comment.content }
        render :json => msg, :status => 201
      else
        render :json => { :error => "Missing parameters." }, :status => 400
      end
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
  
  def show
    if (Issue.where(id: params[:issue_id]).exists?)
      if Comment.where(id: params[:comment_id], issue_id: params[:issue_id]).exists?
        @comment = Comment.find(params[:comment_id])
        render status: :ok, file: "api/comments/show.json.jbuilder"
      else
        render :json => { :error => "Comment not found." }, :status => 404
      end
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
  
  def update
    if (Issue.where(id: params[:issue_id]).exists?)
      if Comment.where(id: params[:comment_id], issue_id: params[:issue_id]).exists?
        @comment = Comment.find(params[:comment_id])
        if @comment.user_id == current_user.id
          @comment.content = params[:text]
          if @comment.save
            msg = { :message => "Comment edited", :id => @comment.id, :text => @comment.content }
            render :json => msg, :status => 200
          else
            render :json => { :error => "Missing parameters." }, :status => 400
          end
        else
          render :json => { :error => "This is not your comment." }, :status => :unauthorized
        end
      else
        render :json => { :error => "Comment not found." }, :status => 404
      end
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
  
  def destroy
    if (Issue.where(id: params[:issue_id]).exists?)
      if Comment.where(id: params[:comment_id], issue_id: params[:issue_id]).exists?
        @comment = Comment.find(params[:comment_id])
        if @comment.user_id == current_user.id
          @comment.destroy
          render :json => { :message => "Comment deleted" }, :status => 200
        else
          render :json => { :error => "This is not your comment." }, :status => :unauthorized
        end
      else
        render :json => { :error => "Comment not found." }, :status => 404
      end
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
end
