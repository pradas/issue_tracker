class ResumesController < ApplicationController

   def new
      @resume = Resume.new
   end
   
   def create
      @resume = Resume.new(resume_params)
      @resume.name = params[:resume][:attachment].original_filename
      @resume.issue_id = params[:issue_id]
      @resume.user_id = current_user.id
      
      redirect_to Issue.find(params[:issue_id])
   end
   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_back(fallback_location: root_path)
   end
   
   private
   
   def resume_params
      params.permit(:name, :attachment)
   end
   
end