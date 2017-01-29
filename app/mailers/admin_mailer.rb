class AdminMailer < ApplicationMailer
  default from: 'guenther@peak.org'

  def email_purchase_details(purchase)
    p "***********************************"
    p "In email_purchase_details"
    @purchase = purchase
    # @url = purchase_path
    mail(to: 'justgrasse@gmail.com', subject: "New order placed")
  end
end
