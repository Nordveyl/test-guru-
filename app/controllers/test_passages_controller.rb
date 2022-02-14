class TestPassagesController < ApplicationController

  before_action :set_test_passage

  def show 
  
  end 

  def resault 
  
  end 

  def update 
    @test_passage.accept!(params[:answer_id])
    
    if @test_passage.completed? 
      redirect_to resault_test_passage_path(@test_passage)
    else   
      render :show
    end   
  end   

  private 

  def set_test_passage 
    @test_passage = TestPassage.find(params[:id])
  end   
end