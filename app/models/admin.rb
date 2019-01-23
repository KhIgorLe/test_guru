class Admin < User
  has_many :author_tests, class_name: "Test", foreign_key: "author_id"

  validates :last_name, presence: true
end
