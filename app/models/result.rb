# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  test_id    :integer          not null
#  completed  :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user

  validates :user, uniqueness: { scope: :test, message: "Test for user already exist" }
end
