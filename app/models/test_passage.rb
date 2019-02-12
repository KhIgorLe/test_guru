# == Schema Information
#
# Table name: test_passages
#
#  id                  :bigint(8)        not null, primary key
#  user_id             :integer
#  test_id             :integer
#  correct_questions   :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_question_id :integer
#  passed              :boolean          default(FALSE)
#

class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85.freeze

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: "current_question_id",
             optional: true

  before_validation :set_first_question, on: :create
  before_update     :set_next_question

  scope :user, -> (user) { where(user: user) }

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

  def passed!
    update(passed: true)
  end

  def remaining_seconds
    (created_at + test.time.seconds - Time.current).to_i if test_has_timer?
  end

  def timeout?
    remaining_seconds <= 0 if test_has_timer?
  end

  def test_has_timer?
    test.has_timer?
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
    test.questions.order(:id).where('id > ?', current_question&.id).first
  end
end
