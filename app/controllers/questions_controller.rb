class QuestionsController < ApplicationController
  
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit update destroy]

  after_action :send_log_controller_action
  around_action :send_log_execution_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
    @questions = @test.questions
  end

  def show
    @answers = @question.answers
  end
 
  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end
 
  def destroy
    @question.destroy
 
    redirect_to test_questions_path(@question.test)
  end
  
  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def send_log_controller_action
    logger.info("[#{controller_name}] [#{action_name}] was executed!")
  end
  
  def send_log_execution_time
    start = Time.now
    yield
    finish = Time.now - start
    
    logger.info("Execution time: #{finish * 1000}ms")
  end 
  
  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
