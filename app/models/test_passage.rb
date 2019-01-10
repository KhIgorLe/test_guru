class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: "current_question_id",
             optional: true

  #  validates :user, uniqueness: { scope: :test, message: "Test for user already exist" }

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers.count == answer_ids.count
  end

  def correct_answers
    current_question.answers.corrects
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
