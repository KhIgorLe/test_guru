# == Schema Information
#
# Table name: tests
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  level       :integer          default(0), not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer          not null
#  time        :integer
#

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "Admin", foreign_key: "author_id"

  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, :level, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to_than: 0 }

  scope :level, -> (level) { where(level: level) }
  scope :passed, -> { where(test_passages: { passed: true }) }
  scope :category, -> (category_id) { where(category_id: category_id) }

  scope :easy,       -> { level(0) }
  scope :elementary, -> { level(1) }
  scope :advanced,   -> { level(2) }
  scope :hard,       -> { level(3) }
  scope :hero,       -> { level(4..Float::INFINITY) }

  def has_timer?
    time.present?
  end
end
