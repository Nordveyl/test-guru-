class Test < ApplicationRecord
  def self.sort_by_category(category_name)
    Test 
      .joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { name: category_name})
      .order(id: :DESC)
      .pluck(:title)
  end   
end
