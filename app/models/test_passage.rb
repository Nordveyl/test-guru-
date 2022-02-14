class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create 

  before_update :before_update_set_next_question

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
    index = test.questions.pluck(:id).index(current_question.id)
    nubber_of_question = index + 1
  end 
    
  def count_of_questions  
    test.questions.count 
  end   

  def successful? 
    procents_of_succesful >= 85
  end 

  def procents_of_succesful  
    correct_questions/count_of_questions*100 
  end   
  
  private 

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present? 
  end   

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort 

    if answers.ids == nil 
      false  
    end   
  end 
  
  def correct_answers 
    corrent_question.answers.correct   
  end   

  def next_qestion 
    test.questions.order(:id).where('id > ?', current_question.id).first 
  end  

  def before_update_set_next_question 
    self.current_question = next_qestion
  end    
end
