class FeedbacksMailer < ApplicationMailer
  def send_feedback(params)
    @user = params[:email]
    @body = params[:body]

    mail to: Admin.pluck(:email), subject: params[:subject]
  end
end
