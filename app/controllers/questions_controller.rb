class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create new ]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create 
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end   
  end   

  def new
    @question = @test.questions.build
  end 

  def show
    render plain: @question.name
  end 

  def destroy 
    @question.destroy 
    redirect_to test_path(@question.test)
  end   

  def edit; end 

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else 
      render :edit 
    end 
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
