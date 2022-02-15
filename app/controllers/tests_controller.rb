class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index 
    @tests = Test.all 
  end   

  def show; end

  def create 
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end   
  end   

  def new 
    @test = Test.new
  end  

  def edit; end 

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else 
      render :edit 
    end 
  end  

  def destroy 
    @test.destroy 
    redirect_to tests_path
  end  

  def start 
    set_user
    @user.tests.push(@test) 
    redirect_to @user.test_passage(@test) 
  end   

  private

  def set_user 
    @user = User.first
  end   

  def set_test 
    @test = Test.find(params[:id])
  end 

  def rescue_with_test_not_found
    render plain: 'Test was not found'  
  end  

  def test_params 
    params.require(:test).permit(:title, :level, :category_id, :author_id )
  end 
end
