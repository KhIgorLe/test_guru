module TestsHelper
  TEST_LEVELS = { 0 => 'Easy', 1 => 'Elementary', 2 => 'Advanced', 3 => 'Hard', 4 => 'Hero' }.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || TEST_LEVELS.values.last
  end
end
