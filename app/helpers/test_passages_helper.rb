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
      "Test successfully completed"
    else
      "Test failed"
    end
  end
end
