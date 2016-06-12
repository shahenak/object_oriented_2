class Item

  attr_accessor :name, :price, :sales_tax, :import_tax

  def initialize(name, price, sales_tax, import_tax)
    @name = name
    @price = price
    @sales_tax = sales_tax
    @import_tax = import_tax
  end
  
end
