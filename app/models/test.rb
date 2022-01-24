class Test < ApplicationRecord
  belongs_to :category 
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy 
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true 
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }

  validate :validate_min_level

  def self.sort_by_category(category_name)
    Test 
      .joins(:category)
      .where(categories: { name: category_name})
      .order(id: :DESC)
      .pluck(:title)
  end   

  private 

  def validate_min_level 
    errors.add :level if level.to_i <= 0
  end    
end
