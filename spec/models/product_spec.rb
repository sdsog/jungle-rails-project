# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.create name: 'TEST CATEGORY'
  end

  describe 'Validations' do
    it 'creates a new product' do
      @product = Product.create name: 'name', price: 1, quantity: 1, category: @category
      expect(@product).to be_valid
    end

    it 'a product should require a name' do
      @product = Product.create name: nil, price: 1, quantity: 1, category: @category
      expect(@product).to_not be_valid
    end

    it 'a product should have a quantity' do
      @product = Product.create name: 'name', price: 1, quantity: nil, category: @category
      expect(@product).to_not be_valid
    end

    it 'a product should have a price' do
      @product = Product.create name: 'name', price: nil, quantity: 1, category: @category
      expect(@product).to_not be_valid
    end

    it 'a product should have a category' do
      @product = Product.create name: 'name', price: 1, quantity: 1, category: nil
      expect(@product).to_not be_valid
    end
  end
end
