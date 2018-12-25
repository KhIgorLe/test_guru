# == Schema Information
#
# Table name: tests
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  level       :integer          default(0), not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#

require 'test_helper'

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
