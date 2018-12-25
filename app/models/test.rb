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

  def self.categories(title)
    Test.joins(:category).where(categories: { title: title }).order(title: :desc).pluck(:title)
  end
end
