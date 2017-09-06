class AwsaccountsController < ApplicationController

  def create
    @awsaccount = current_user.awsaccounts.new(awsaccount_params)
    if @awsaccount.save
      flash[:notice] = "#{@awsaccount.account_id} saved!"
      render json: {awsaccount: @awsaccount}
    else
      render json: {errors: @awsaccount.errors.full_messages}, status: 422
    end
  end

  private

  def awsaccount_params
    params.require(:awsaccount).permit(:project_id, :account_id, :estimated_spend)
  end
end