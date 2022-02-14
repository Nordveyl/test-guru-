class Test < ApplicationRecord
  belongs_to :category 
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy 
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true 
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.sort_by_category(category_name)
    Test 
      .joins(:category)
      .where(categories: { name: category_name})
      .order(id: :DESC)
      .pluck(:title)
  end
end
