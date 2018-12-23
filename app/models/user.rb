# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  def tests_with_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
      .where("tests.level = :level AND results.user_id = :id ", level: level, id: id)
  end
end
