class ConsultantsController < ApplicationController
  before_action :set_consultant, only: [:show, :update]

  def index
    @consultants = Consultant.all
  end

  def show

  end

  def new
    @expertises = Expertise.all
  end

  def create

  end

  def update

  end

  private

    def consultant_params
      params.require(:consultant).permit(:name, :title, :background, expertise_ids: [])
    end

    def set_consultant
      @consultant = Consultant.find(params[:id])
    end
end