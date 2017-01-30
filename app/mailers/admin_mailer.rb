class AdminMailer < ApplicationMailer
  default from: ENV['COMMISH_EMAIL']

  def email_purchase_details(purchase)
    @purchase = purchase
    mail(to: @purchase.email, subject: "New order placed")
  end
end
