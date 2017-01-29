class PurchasesController < ApplicationController
  def create
    if params[:supermutant] == 'yes'
      redirect_to 'http://en.wikipedia.org/wiki/Pacifism'
      return
    end
    purchase = Purchase.new(purchase_params)
    purchase.robot_id = params[:robot_id]
    if purchase.save
      flash[:notice] = 'your robot has been purchased.'
      purchase.robot.update_attribute(:available, false)
      redirect_to robots_path
    else
      flash[:error] = 'purchases require a name and valid email'
      redirect_to robot_path(purchase.robot)
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :email)
  end
end
