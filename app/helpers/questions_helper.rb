module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.test.title} Question"
    else 
      test = Test.find(params[:test_id])
      "Create New #{test.title} Question"
    end 
  end     
end
