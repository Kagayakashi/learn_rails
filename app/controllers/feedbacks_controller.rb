class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      FeedbackMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: 'Сообщение отправлено!'
    end
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
