# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visitor adds item to cart', type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |_n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'and the cart navigation icon quantity is updated', :focus do
    # ACT
    visit root_path

    first('footer.actions').click_button('Add')

    # DEBUG / VERIFY
    within('#navbar') { expect(page).to have_content('My Cart (1)') }
    save_screenshot
  end
end
