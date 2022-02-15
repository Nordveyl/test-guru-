class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids) 
      self.correct_questions += 1
    end  
    save!
  end 

  def completed?  
    current_question.nil? 
  end 

  def number_of_current_question 
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end 
    
  def count_of_questions  
    test.questions.count 
  end   

  def successful? 
    procents_of_succesful >= SUCCESS_RATIO
  end 

  def procents_of_succesful  
    correct_questions/count_of_questions*100 
  end   
  
  private 

  def correct_answer?(answer_ids)
    if answer_ids != nil 
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort 
    else 
      false  
    end      
  end 
  
  def correct_answers 
    corrent_question.answers.correct   
  end   

  def next_question 
    if self.current_question == nil 
      self.current_question = test.questions.first if test.present?
    else   
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first 
    end   
  end  

  def set_current_question
    self.current_question = next_question
  end
end
