class User < ApplicationRecord
  has_many :results, dependent: :destroy 
  has_many :tests, through: :results, dependent: :destroy
  has_many :created_tests, class_name 'Test', dependent: :destroy

  def show_passed_tests(level)
   tests.where(level: level)
  end     
end
