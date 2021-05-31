require 'rails_helper'

RSpec.describe Product, type: :model do
    
  it "creates category and product with all 4 fileds filled" do
    @category = Category.new(name: "Rick Sanchez' Inventions")
    @category.save
    @product = Product.new(
      name: "Portal gun", 
      price: 666, 
      quantity: 9, 
      category: @category
    )
    expect(@product).to be_valid
  end

end
