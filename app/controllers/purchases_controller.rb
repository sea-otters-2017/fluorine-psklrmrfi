class PurchasesController < ApplicationController
  def create
    purchase = Purchase.new(purchase_params)
    purchase.robot_id = params[:robot_id]
    if purchase.save
      flash[:notice] = 'Your robot has been purchased.'
      redirect_to robots_path
    else
      flash[:notice] = 'Something went wrong.'
      # render
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :email)
  end
end
