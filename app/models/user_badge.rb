# == Schema Information
#
# Table name: user_badges
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        not null
#  badge_id   :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :user
end
