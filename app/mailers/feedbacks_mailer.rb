class FeedbacksMailer < ApplicationMailer

  def form(feedback)
    @name = feedback.name
    @email = feedback.email
    @message = feedback.message

    mail to: ENV['ADMIN_EMAIL'], subject: "TestGuru has new feedback!"
  end

end