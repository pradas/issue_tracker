class ApiIssuesController < ApplicationController
    def index
        @issues = Issue.all
        render status: :ok, file: "api/issues/index.json.jbuilder"
    end
    
    def create
        aux = Issue.exists(params[:id])
        if (issue.nil?)
            @issue = Issue.new(issue_params)
            respond_to do |format|
                if @issue.save
                    msg = { :status => "created", :message => "Success!", :id => @issue.id, :title => @issue.title, :user_id => @issue.user_id, :kind => @issue.kind, :priority => @issue.priority}
                    format.json { render :json => msg }
                else
                    format.json { render json: @issue.errors, status: :unprocessable_entity }
                end
            end
        else
            @issue = aux
            render status: :ok, file: "api/issues/create.json.jbuilder"
        end
    end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :description, :user_id, :status,:kind, :priority, :votes, :watchers)
    end
end
