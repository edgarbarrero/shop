require_relative 'pricer'

class Cart
  AVAILABLE_PRODUCTS = %w(GR1 SR1	CF1)

  def initialize
    @products = []
  end

  def scan(product)
    return false unless AVAILABLE_PRODUCTS.include? product

    @products << product
    true
  end

  def total
    @products.tally.sum { |product, quantity| Pricer.new(product, quantity).call }
  end
end
