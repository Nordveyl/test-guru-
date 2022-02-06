class TestsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index 
    @tests = Test.all 
  end   

  def show
    @test = Test.find(params[:id])
  end

  def create 
    @test = Test.create(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end   
  end   

  def new 
    @test = Test.new
  end  

  def edit 
    @test = Test.find(params[:id])
  end 

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      redirect_to tests_path
    else 
      render :edit 
    end 
  end  

  def destroy 
    @test = Test.find(params[:id])

    @test.destroy 
    redirect_to tests_path
  end   

  private

  def rescue_with_question_not_found
    render plain: 'Test was not found'  
  end  

  def test_params 
    params.require(:test).permit(:title, :level)
  end 
end
