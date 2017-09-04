class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update]

  def index
    @projects = Project.includes(:customer)
  end

  def show
    @project = Project.includes(:customer, :user).find(params[:id])
    @customers = Customer.all
    @consultants = Consultant.all
  end

  def new
    @customers = Customer.all
    @consultants = Consultant.all
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

  def update
    if @project.update_attributes(project_params)
      flash[:notice] = "#{@project.title} updated!"
      render json: {project: @project}
    else
      render json: {errors: @project.errors.full_messages}, status: 422
    end
  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :industry, :engagement_date,
        :engagement_duration, :country, :business_problem, :drivers, :outcome, :solution,
        :solution_explanation, :people_resource, :links, :metrics, :contacts, :customer_id,
        consultant_ids: [])
    end

    def set_project
      @project = Project.find(params[:id])
    end
end