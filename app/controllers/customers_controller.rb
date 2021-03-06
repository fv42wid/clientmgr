class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:show, :new, :create, :update]

  def index
    @customers = Customer.includes(:projects)
  end

  def show
    @projects = @customer.projects
    respond_to do |format|
      format.html
      format.json {render json: @customer}
    end
  end

  def new

  end

  def create
    @customer = current_user.customers.new(customer_params)
    if @customer.save
      flash[:notice] = "#{@customer.name} created!"
      render json: {customer: @customer}
      #redirect_to @customer
    else
      render json: {errors: @customer.errors.full_messages}, status: 422
    end
  end

  def update
    if @customer.update_attributes(customer_params)
      render json: {customer: @customer}
    else
      render json: {errors: @customer.errors.full_messages}, status: 422
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :website, :description)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end
end