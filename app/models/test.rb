class Test < ApplicationRecord
  def self.categories(title)
    categories = Category.select(:id).where(title: title)

    Test.where(category_id: categories).order(title: :desc).pluck(:title)
  end
end
