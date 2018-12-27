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

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions
  has_many :results
  has_many :users, through: :results

  validates :title, :level, presence: true
  validates :title, uniqueness: { scope: :level, message: "with this level already exists" }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to_than: 0 }

  scope :level, -> (level) { where(level: level) }
  scope :categories, -> (title) do
    joins(:category).where(categories: {title: title}).order(title: :desc)
  end

  scope :easy,   -> { level(0..1) }
  scope :normal, -> { level(2..4) }
  scope :hard,   -> { level(5..Float::INFINITY) }
end
