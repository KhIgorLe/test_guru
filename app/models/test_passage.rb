class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85.freeze

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: "current_question_id",
             optional: true

  before_validation :set_first_question, on: :create
  before_update     :set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def count_questions
    test.questions.count
  end

  def current_question_number
    test.questions.index(current_question).to_i + 1
  end

  def percent_correct_answers
    100 * correct_questions / count_questions
  end

  def successfully_completed?
    percent_correct_answers >= SUCCESS_PERCENT
  end

  def remaining_seconds
    (created_at + test.time.seconds - Time.current).to_i
  end

  def timeout?
    remaining_seconds <= 0
  end

  private

  def set_first_question
    self.current_question = test.questions.first
  end

  def set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.blank?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.corrects
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
