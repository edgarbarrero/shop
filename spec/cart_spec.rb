require_relative '../src/cart'

RSpec.describe "Cart", :type => :system do
  it "get correct price for scanned items" do
    cart = Cart.new
    %w(GR1 SR1 GR1 GR1 CF1).each do |item|
      cart.scan(item)
    end
    expect(cart.total).to eq(22.45)

    cart = Cart.new
    %w(GR1 GR1).each do |item|
      cart.scan(item)
    end
    expect(cart.total).to eq(3.11)

    cart = Cart.new
    %w(SR1 SR1 GR1 SR1).each do |item|
      cart.scan(item)
    end
    expect(cart.total).to eq(16.61)
  end
end
