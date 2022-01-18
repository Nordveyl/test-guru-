class Test < ApplicationRecord
	def self.sorted_test(category)
	  Test 
	  .joins('JOIN categories ON categories.id = tests.category_id')
	  .where(categories: { name: category})
	  .order('id DESC')
	end  	
end
