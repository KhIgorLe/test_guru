class AnswersController < ApplicationController
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[edit update destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  def new
    @answer = @question.answers.new
  end

  def show
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question)
    else
      render :edit
    end

  end

  def destroy
    @answer.destroy
    redirect_to question_path(@answer.question)
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def rescue_with_answer_not_found
    render plain: "Answer not found"
  end

end
