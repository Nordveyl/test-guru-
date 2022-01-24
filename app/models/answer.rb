class Answer < ApplicationRecord
  belongs_to :question 

  scope :corrected, -> { where(correct: true) }

  validates :name, presence: true 

  validate :validate_count_of_answers 

  private 

  def validate_count_of_answers 
    errors.add :base if question.answers.count >= 4 
  end  
end
