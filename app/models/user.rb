class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results, dependent: :destroy
  has_many :created_tests, class_name 'Test', dependent: :destroy

  validates :first_name, presence: true 
  validates :last_name, presence: true

  def show_passed_tests(level)
    tests.where(level: level)
  end     
end
