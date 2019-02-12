# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  body       :string           not null
#  test_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :test
  has_many   :answers
  has_many   :test_passages

  validates :body, presence: true
  validates :body, uniqueness: { scope: :test, message: "Question for test already exist" }
end
