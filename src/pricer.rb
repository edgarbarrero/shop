require 'yaml'

class Pricer
  def initialize(product, quantity)
    @product = product
    @quantity = quantity.to_i
    @pricing = YAML.load_file("#{File.dirname __FILE__}/../config/pricing.yml")
  end

  def call
    if discount_kind == "buy-one-get-one-free"
      unit_price * buy_one_get_one_free_quantity
    elsif discount_kind == "bulk_discount"
      bulk_discount_price * @quantity
    elsif discount_kind.nil?
      unit_price * @quantity
    end.round(2)
  end

  private

  def discount_kind
    @pricing[@product]['discount_kind']
  end

  def unit_price
    @pricing[@product]['unit_price'].to_f
  end

  def buy_one_get_one_free_quantity
    (@quantity/2.to_f).ceil
  end

  def bulk_discount_price
    return unit_price if @quantity < 3

    @pricing[@product]['bulk_discount_price'].to_f
  end
end
