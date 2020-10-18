class NotificationMailer < ApplicationMailer
  default from: "ba023082@gmail.com"

  def send_confirm_to_user(user, item, order)
    @user = user
    @item = item
    @order = order
    mail(
      subject: "ご購入いただきありがとうございます", #メールのタイトル
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
