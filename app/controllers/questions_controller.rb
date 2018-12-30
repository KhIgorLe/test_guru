class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render json: { questions: @questions }
  end

  def show
    @question = @test.questions.find(params[:id])

    respond_to do |format|
      format.html { @question }
      format.json{ render json: @question }
    end
  end

  def new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to "/tests/#{@test.id}/questions/#{@question.id}"
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
