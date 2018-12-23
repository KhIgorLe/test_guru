class User < ApplicationRecord
  def tests_with_level(level)
    results = Result.select(:test_id).where(user_id: id)

    Test.where(level: level, id: results)
  end
end
