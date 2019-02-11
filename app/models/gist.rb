# == Schema Information
#
# Table name: gists
#
#  id          :bigint(8)        not null, primary key
#  url         :string           not null
#  question_id :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :url, presence: true

  def hash_url
    url.split('/').last
  end
end
