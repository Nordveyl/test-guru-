module QuestionsHelper
  def question_header(test_or_question)
    if test_or_question.class == Question 
      "Edit #{test_or_question.test.title} Question"
    else 
      "Create New #{test_or_question.title} Question"
    end 
  end     
end
