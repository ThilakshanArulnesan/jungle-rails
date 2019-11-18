require 'rails_helper'

# create_table "users", force: :cascade do |t|
#   t.string   "first_name"
#   t.string   "last_name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create! first_name: 'TH', last_name: "Ar", email: "th@gmail.com", password: "123456", password_confirmation: "123456"
  end

  scenario "They can " do
    visit root_path

    click_on 'Login'

    expect(page).to have_css 'form'

    find_by_id('email').send_keys :command, 'th@gmail.com'
    find_by_id('password').send_keys(:command, '123456')

    click_on 'Submit'

    expect(page).to have_text 'Logout'

    save_and_open_screenshot



    # expect(page).to have_css '.fa-shopping-cart'
    # # visit (first 'de').click
    # expect(first('a[href="/cart"]').text).to include("0")

    # (first 'button').click
    # expect(first('a[href="/cart"]').text).to include("1")

    # expect(page).to have_css('article.product-detail')
  end
end
