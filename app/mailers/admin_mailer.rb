class AdminMailer < ActionMailer::Base
  default from: "yourstore@storedom.com"
  TO = "storedom-overlord@example.com"

  def email_order(id)
    @item = Item.find(id)
    mail(to: TO, subject: 'Order created.')
  end
end
