class NotificationMailer < ApplicationMailer
  default from: "ba@gmail.com"

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "ご購入いただきありがとうございます", #メールのタイトル
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
