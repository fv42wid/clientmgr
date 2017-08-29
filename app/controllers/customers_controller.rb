class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def new

  end

  def create
    @customer = current_user.customers.new(customer_params)
    if @customer.save

    else

    end
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :website, :description)
    end
end