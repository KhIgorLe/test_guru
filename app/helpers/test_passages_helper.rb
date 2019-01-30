module TestPassagesHelper
  def completed_color
    if @test_passage.successfully_completed?
      "green"
    else
      "red"
    end
  end

  def completed_text
    if @test_passage.successfully_completed?
      t('success')
    else
      t('failed')
    end
  end

  def progress
    (@test_passage.current_question_number - 1) * 100 / @test_passage.count_questions
  end
end
