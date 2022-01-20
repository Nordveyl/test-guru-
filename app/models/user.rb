class User < ApplicationRecord
  has_many :results 
  has_many :tests, through: :results
  has_many :created_tests, class_name 'Test'
  def show_passed_tests(level)
    Test 
      .joins('JOIN results ON rusults.test_id = tests.id')
      .where(results: {user_id: id}, level: level)
  end     
end
