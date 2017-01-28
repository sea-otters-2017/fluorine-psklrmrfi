class PurchasesController < ApplicationController

  def create
    purchase = Purchase.new(purchase_params)
    if purchase.save
      flash[:notice] = 'Your robot has been purchased.'
      redirect_to robots_path
    else
      #re-render that robot page
    end
  end

  private

  def purchase_params
    params.require[:robot].permit[:name, :email]
  end
end
