require_relative '../test_helper'

class OneClickOrderTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_has_a_checkout_button
    item = Item.create(name: "jeff", description: "gu")
    visit root_path
    visit "items/#{item.id}"
    assert page.has_selector?('#checkout')
  end

  def test_it_creates_an_order_after_checkout
    item = Item.create(name: "jeff", description: "gu")
    visit "items/#{item.id}"
    click_link_or_button "One Click Checkout"
    user = User.create(name: "jeffy", email: "gu@gu.com")
    assert_equal user.id, Order.first.user_id
  end

end
