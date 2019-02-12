class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]
  before_action :check_timeout, only: :update

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?

      TestsMailer.completed_test(@test_passage).deliver_now

      if @test_passage.successfully_completed?
        @test_passage.passed!

        @badges = BadgeUserService.new(@test_passage).get_badges

        if @badges.present?
          current_user.badges.push(@badges)

          flash[:notice] = "Вы получили бейдж"
        end
      end

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    response = result.call

    if result.status_ok?
      gist = current_user.gists.create(url: response.html_url, question: @test_passage.current_question)

      flash[:success] = t('.success', url: gist.url)
    else
      flash[:warning] = t('.warning')
    end

    redirect_to @test_passage
  end

  private

  def check_timeout
    redirect_to result_test_passage_path(@test_passage) if @test_passage.timeout?
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
