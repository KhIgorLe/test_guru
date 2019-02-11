# == Schema Information
#
# Table name: answers
#
#  id          :bigint(8)        not null, primary key
#  body        :string           not null
#  question_id :integer          not null
#  correct     :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates :body, uniqueness: { scope: :question, message: "Answer for question already exist" }

  validate :validate_answers_count, on: :create

  scope :corrects, -> { where(correct: true) }

  private

  def validate_answers_count
    return if question.blank?

    errors.add(:answers, message: "may have up to 4 answers") if question.answers.count > 3
  end
end
