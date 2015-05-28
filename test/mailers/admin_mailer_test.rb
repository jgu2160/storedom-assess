require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  def test_it_sends_an_email
    item = Item.create(name: "jeff", description: "gu")
    order = Order.create(user_id: 1, amount: 3, item_id: item.id)
    assert_difference("ActionMailer::Base.deliveries.count", 1) do
      AdminMailer.email_order(order).deliver
    end
  end
end
