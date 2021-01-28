class OrderMailer < ApplicationMailer
  default from: 'Test <test@example.com>'

  layout 'mailer'

  def order_email(user)
    @user = user
    mail(to: @user.email, subject: 'From Organizer')
  end

  def destroy_order(user)
    @user = user
    mail(to: @user.email, subject: 'From Organizer')
  end

  def test_send(email)
    @email = email
    mail(to: @email, subject: 'Test Send')
  end
end
