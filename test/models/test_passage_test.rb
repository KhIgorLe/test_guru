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

require 'test_helper'

class TestPassageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
