require_relative 'cart'

TOTAL = 'total'
scan_next_product = true
cart = Cart.new

puts "Available products are GR1 SR1	CF1"
while scan_next_product do
  puts "Enter a code product or type 'total' to get your cart total amount"
  input = gets.chomp

  if input == TOTAL
    scan_next_product = false
  else
    puts "wrong code product" unless cart.scan(input)
  end
end

puts cart.total
