class Test < ApplicationRecord
  belongs_to :category 
  belongs_to :author, class_name: 'User'

  has_many :questions 
  has_many :results 
  has_many :users, through: :results
  def self.sort_by_category(category_name)
    Test 
      .joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { name: category_name})
      .order(id: :DESC)
      .pluck(:title)
  end   
end
