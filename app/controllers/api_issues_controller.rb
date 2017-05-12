class ApiIssuesController < ApplicationController
  def index
    @issues = Issue.all
    render status :ok, file: "api/issues/index.json.jbuilder"
  end
end
