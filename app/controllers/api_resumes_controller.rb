class ApiResumesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate, only: [:create, :update, :destroy]
  
  def index
    if (Issue.where(id: params[:issue_id]).exists?)
      @resumes = Resume.where(issue_id: params[:issue_id])
      render status: :ok, file: "api/resumes/index.json.jbuilder"
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
  
  def create
    if (Issue.where(id: params[:issue_id]).exists?)
      @resume = Resume.new()
      @resume.name = params[:resume][:attachment].original_filename
      @resume.attachment = params[:resume]
      @resume.issue_id = params[:issue_id]
      @resume.user_id = current_user.id

      if @resume.save
        msg = { :message => "Attachment created", :id => @resume.id, :name => @resume.name }
        render :json => msg, :status => 201
      else
        render :json => { :error => "Missing parameters." }, :status => 400
      end
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
  
  def show
    if Issue.where(id: params[:issue_id]).exists?
      if Resume.where(id: params[:attachment_id], issue_id: params[:issue_id]).exists?
        @resume = Resume.find(params[:attachment_id])
        render status: :ok, file: "api/resumes/show.json.jbuilder"
      else
        render :json => { :error => "Attachment not found." }, :status => 404
      end
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
  
  def destroy
    if Issue.where(id: params[:issue_id]).exists?
      if Resume.where(id: params[:attachment_id], issue_id: params[:issue_id]).exists?
        @resume = Resume.find(params[:attachment_id])
        if @resume.user_id == current_user.id
          @resume.destroy
          render :json => { :message => "Attachment deleted" }, :status => 200
        else
          render :json => { :error => "This is not your attachment." }, :status => :unauthorized
        end
      else
        render :json => { :error => "Attachment not found." }, :status => 404
      end
    else
      render :json => { :error => "Issue not found." }, :status => 404
    end
  end
end
