# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'test+test@test.com'

  def order_confirmation(user, order)
    email = user.email
    @user = user.name
    @order = order
    @orderid = order.id
    mail(to: email, subject: "Order ##{@orderid} has been received")
  end
end
