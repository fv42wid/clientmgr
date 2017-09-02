class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index

  end

  def show

  end

  def new
    @customers = Customer.all
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      flash[:notice] = "#{@project.title} created!"
      render json: {project: @project}
    else
      render json: {errors: @project.errors.full_messages}, status: 422
    end
  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :industry, :engagement_date,
        :engagement_duration, :country, :business_problem, :drivers, :outcome, :solution,
        :solution_explanation, :people_resource, :links, :metrics, :contacts, :customer_id)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end