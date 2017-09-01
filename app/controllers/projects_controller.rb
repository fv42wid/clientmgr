class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index

  end

  def show

  end

  def new

  end

  def create

  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :industry, :engagement_date,
        :engagement_duration, :country, :business_problem, :drivers, :outcome, :solution,
        :solution_explanation, :peope_resources, :contacts, :customer_id)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end