class Test < ApplicationRecord
  belongs_to :category 
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy 
  has_many :results, dependent: :destroy 
  has_many :users, through: :results, dependent: :destroy

  def self.sort_by_category(category_name)
    Test 
      .joins(:category)
      .where(categories: { name: category_name})
      .order(id: :DESC)
      .pluck(:title)
  end   
end
