class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # POST /issues/:id/comments
  def create
    @comment = Comment.new(comment_params)
    @comment.pin = false
    @comment.spam = false
    @comment.issue_id = params[:issue_id]
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to Issue.find(params[:issue_id]) }
        #format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue/1/comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to Issue.find(params[:issue_id]) }
        #format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1/comments/1
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to Issue.find(params[:issue_id])}
      #format.json { head :no_content }
    end
  end
  
  private
  
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :pin, :spam, :issue_id, :user_id)
    end
end
