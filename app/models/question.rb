# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  test_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :test

  validates :body, :test, presence: true
  validates :body, uniqueness: { scope: :test, message: "Question for test already exist" }

  has_many :answers
end
