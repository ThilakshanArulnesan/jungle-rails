require 'rails_helper'

RSpec.feature "User can add to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    visit root_path
    expect(page).to have_css '.fa-shopping-cart'
    # visit (first 'de').click
    expect(first('a[href="/cart"]').text).to include("0")

    (first 'button').click
    expect(first('a[href="/cart"]').text).to include("1")

    # expect(page).to have_css('article.product-detail')
  end
end
