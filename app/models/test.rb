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
#

class Test < ApplicationRecord
  def self.categories(title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
      .where("categories.title = :title", title: title).order(title: :desc).pluck(:title)
  end
end
