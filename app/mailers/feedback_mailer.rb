class FeedbackMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback
    mail to: ENV['ADMIN_MAIL_TO'], subject: ENV['ADMIN_MAIL_SUBJECT']
  end
end
