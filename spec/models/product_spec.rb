require 'rails_helper'

RSpec.describe Product, type: :model do
    
  it "saves properly after filling out all fields correctly" do
    @category = Category.new(name: "Rick Sanchez' Inventions")
    @category.save
    @product = Product.new(
      name: "Portal gun", 
      price: 666, 
      quantity: 9, 
      category: @category
    )
    @product.save
    expect(@product).to be_valid
  end


  it "does not save product if name is nil" do
    @category = Category.new(name: "Rick Sanchez' Inventions")
    @category.save
    @product = Product.new(
      name: nil, 
      price: 666, 
      quantity: 9, 
      category: @category
    )
    @product.save
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).not_to be_empty
  end


  it "does not save product if price is nil" do
    @category = Category.new(name: "Rick Sanchez' Inventions")
    @category.save
    @product = Product.new(
      name: "Butter Robot", 
      price: nil, 
      quantity: 23, 
      category: @category
    )
    @product.save
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).not_to be_empty
  end


  it "does not save product if quantity is nil" do
    @category = Category.new(name: "Rick Sanchez' Inventions")
    @category.save
    @product = Product.new(
      name: "Meeseeks Box", 
      price: 999, 
      quantity: nil, 
      category: @category
    )
    @product.save
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).not_to be_empty
  end


  it "does not save product if category is nil" do
    @category = Category.new(name: "Rick Sanchez' Inventions")
    @category.save
    @product = Product.new(
      name: "Microverse Battery", 
      price: 450, 
      quantity: 45, 
      category: nil
    )
    @product.save
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).not_to be_empty
  end

end
