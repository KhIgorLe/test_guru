class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: :show

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    redirect_to root_path, alert: "Question not found"
  end
end
