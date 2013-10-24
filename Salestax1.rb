# module Utils
# 	#self creates a method applicable to the class or method it is within
# 	def self.round(price)
# 		return price if price % 5 == 0
# 		price + 5 - (price % 5)
# 	end
# end

class Product
	def initialize(quantity, name, price)
		@quantity = quantity
		@a_name = name
		@price = price * 100
	end

	def sales_tax
		subtotal * tax_rate
	end

	def total_price
		subtotal
	end

	def subtotal
		@quantity * @price
	end

	def tax_rate
	0.10
	end
end

class Imported < Product
	def tax_rate
		#super runs the parent's function
		super + 0.05
	end
end

class Exempt < Product
	def tax_rate
		0
	end
end

class ImportedExempt < Exempt
	def tax_rate
		super + 0.05
	end
end

product = Product.new(1, "book", 12.49)
puts product.tax_rate
puts product.sales_tax
puts product.total_price

imported = Imported.new(1, "imported book", 24.95)
puts imported.tax_rate
puts imported.sales_tax
puts imported.total_price

exempt = Exempt.new(1, "exempt book", 24.95)
puts exempt.tax_rate
puts exempt.sales_tax
puts exempt.total_price

imported_exempt = ImportedExempt.new(1, "imported_exempt book", 24.95)
puts imported_exempt.tax_rate
puts imported_exempt.sales_tax
puts imported_exempt.total_price

#still grappling with how to display the results nicely