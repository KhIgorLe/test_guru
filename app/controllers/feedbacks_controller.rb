class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def create
    message_params = feedback_params.merge(email: current_user.email)

    FeedbacksMailer.send_feedback(message_params).deliver_now
    redirect_to root_path
  end

  private

  def feedback_params
    params.permit(:subject, :body).to_h
  end
end
