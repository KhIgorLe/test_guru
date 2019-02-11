class BadgeUserService

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def get_badges
    Badge.all.select { |badge| badge if check_badge?(badge) }
  end

  private

  attr_reader :test_passage

  def check_badge?(badge)
    type = badge.rule_type.downcase

    send("rule_#{type}?", badge.rule_value)
  rescue NoMethodError
    false
  end

  def rule_category?(category_id)
    (Test.category(category_id).ids - user_passed_tests.category(category_id).ids).empty?
  end

  def rule_level?(level)
    (Test.level(level).ids - user_passed_tests.level(level).ids).empty?
  end

  def rule_attempt?(value)
    test_passage.passed? && user.tests.where(id: test.id).count <= value.to_i
  end

  def user_passed_tests
    @user_passed_tests ||= user.tests.passed
  end

  def user
    @user ||= test_passage.user
  end

  def test
    @test ||= test_passage.test
  end
end
