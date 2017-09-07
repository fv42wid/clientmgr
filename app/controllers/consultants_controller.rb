class ConsultantsController < ApplicationController
  before_action :set_consultant, only: [:update]
  before_action :authenticate_user!, only: [:show, :new, :create, :update]

  def index
    @consultants = Consultant.all
  end

  def show
    @consultant = Consultant.includes(:expertises).find(params[:id])
    @expertises = Expertise.all
  end

  def new
    @expertises = Expertise.all
  end

  def create
    @consultant = current_user.consultants.new(consultant_params)
    if @consultant.save
      flash[:notice] = "#{@consultant.name} created!"
      render json: {consultant: @consultant}
    else
      render json: {errors: @consultant.errors.full_messages}, status: 422
    end
  end

  def update
    if @consultant.update_attributes(consultant_params)
      flash[:notice] = "#{@consultant.name} updated!"
      render json: {consultant: @consultant}
    else
      render json: {errors: @consultant.errors.full_messages}, status: 422
    end
  end

  private

    def consultant_params
      params.require(:consultant).permit(:name, :title, :background, expertise_ids: [])
    end

    def set_consultant
      @consultant = Consultant.find(params[:id])
    end
end