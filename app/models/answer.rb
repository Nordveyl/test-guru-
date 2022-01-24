class Answer < ApplicationRecord
  belongs_to :question 

  validates :name, presence: true 
  validate :validate_count_of_answers, on: :create  

  scope :corrected, -> { where(correct: true) }

  private 

  def validate_count_of_answers 
    errors.add :base if question.answers.count >= 4 
  end  
end
