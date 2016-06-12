require_relative "item"

class Receipt

  attr_reader :total_tax, :total_price

  def initialize
    @total = []
    @total_price = []
    @total_price_no_tax = []
    @sum = 0
    @sum_total_price = 0
  end

  # def sales_tax(item)
  #
  #   if (item.sales_tax == false)
  #     @total = item.price
  #     p "1 #{item}: #{total.round(2)}"
  #   else
  #     @total = item.price * 1.10
  #     p "1 #{item}: #{total.round(2)}"
  #   end
  #   add(item)
  # end

  def tax(item)

    if (item.import_tax == false && item.sales_tax == false)
      @total = item.price
      p "1 #{item.name}: #{@total.round(2)}"
    elsif (item.import_tax == false && item.sales_tax == true)
      @total = item.price * 1.10
      p "1 #{item.name}: #{@total.round(2)}"
    elsif (item.import_tax == true && item.sales_tax == false)
      @total = item.price * 1.05
      p "1 #{item.name}: #{@total.round(2)}"
    else (item.import_tax == true && item.sales_tax == true)
      @total = item.price * 1.15
      p "1 #{item.name}: #{@total.round(2)}"
    end
    add(item)

  end

  def add(item)

    if (item.is_a?(Item))
      @total_price_no_tax << item.price
      @total_price << @total
    else
      raise "Error"
    end

  end

  def sum
    @total_price_no_tax.each do |i|
      @sum += i
    end

    @total_price.each do |i|
      @sum_total_price += i
    end

  end

  def return_cart
    sum_no_tax = @sum.round(2)
    sum_with_tax = @sum_total_price.round(2)
    sum_tax = (sum_with_tax - sum_no_tax).round(2)
    puts "Total cart price WITHOUT tax is: #{sum_no_tax}"
    puts "Total tax is: #{sum_tax}"
    puts "Total cart price WITH tax is: #{sum_with_tax}"
  end

end

headphones = Item.new("Headphones", 20.99, true, false)
tylenol = Item.new("Tylenol", 10.95, false, false)
apple = Item.new("Apple", 0.65, true, true)


receipt = Receipt.new

receipt.tax(headphones)
receipt.tax(tylenol)
receipt.tax(apple)

receipt.sum
receipt.return_cart
