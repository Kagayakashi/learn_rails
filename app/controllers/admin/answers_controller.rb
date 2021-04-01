class Admin::AnswersController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_test
  before_action :find_question
  before_action :find_answer

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to admin_test_question_path(@question)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_test_question_path(@question)
    else
      render 'edit'
    end
  end
 
  def destroy
    @answer.destroy
 
    redirect_to admin_test_question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_answer_not_found
    render plain: 'Answer was not found!'
  end
end
