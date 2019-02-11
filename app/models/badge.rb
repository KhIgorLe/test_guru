# == Schema Information
#
# Table name: badges
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  image      :string           not null
#  rule_type  :string           not null
#  rule_value :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Badge < ApplicationRecord
  TYPES = %w(Category Level Attempt).freeze

  validates :title, :image, :rule_type, :rule_value, presence: true
  has_many :user_badges
  has_many :users, through: :user_badges
end
