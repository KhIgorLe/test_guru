module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "New #{question.test.title} Question"
    else
      "Edit #{question.test.title} Question"
    end
  end
end
