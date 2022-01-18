class User < ApplicationRecord
  def show_passed_tests(level)
    Test 
    .joins('JOIN results ON rusults.test_id = tests.id')
    .where(results: {user_id: id}, level: level)
  end     
end
