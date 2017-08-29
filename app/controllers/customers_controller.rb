class CustomersController < ApplicationController
  before_action :set_customer, only: [:show]

  def index
    @customers = Customer.all
  end

  def show
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
      redirect_to @customer
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