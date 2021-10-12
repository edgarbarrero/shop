require_relative '../src/pricer'

RSpec.describe "Pricer", :type => :system do
  describe "for GR1" do
    it "buy-one-get-one-free discount price is correct" do
      [[1, 3.11], [2, 3.11], [3, 6.22], [4, 6.22], [5, 9.33]].each do |element|
        price = Pricer.new('GR1', element[0]).call
        expect(price).to eq(element[1])
      end
    end

    it "bulk_discount price is correct" do
      [[1, 5], [2, 10], [3, 13.5], [4, 18], [5, 22.5]].each do |element|
        price = Pricer.new('SR1', element[0]).call
        expect(price).to eq(element[1])
      end
    end

    it "no discount price is correct" do
      [[1, 11.23], [2, 22.46], [3, 33.69], [4, 44.92], [5, 56.15]].each do |element|
        price = Pricer.new('CF1', element[0]).call
        expect(price).to eq(element[1])
      end
    end
  end
end
