# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true
  validates :title, uniqueness: true

  default_scope { order(title: :asc) }

  scope :title, -> (title) { where(title: title) }
end
