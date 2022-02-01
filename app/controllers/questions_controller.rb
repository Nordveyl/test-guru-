class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  def index 
    questions = @test.questions.pluck(:name)
    render plain: questions.join('  ')
  end 

  def create 
    question = @test.questions.create(question_params)
    if question.persisted?
      redirect_to test_questions_path(@test)
    else 
      render plain: 'not successfully'
    end        
  end   

  def new; end 

  def show
    render plain: @question.name
  end 

  def destroy 
    @question.destroy 
    render plain: 'successfully!'
  end   
  
  private 

  def find_test 
    @test = Test.find(params[:test_id])
  end 

  def find_question 
    @question = Question.find(params[:id])
  end   

  def question_params 
    params.require(:question).permit(:name)
  end   

  def rescue_with_question_not_found
    render plain: 'Question was not found'  
  end  

end
