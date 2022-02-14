class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', dependent: :destroy

  validates :first_name, presence: true 
  validates :last_name, presence: true

  def show_passed_tests(level)
    tests.where(level: level)
  end     

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end   
end
