class Question < ApplicationRecord
  belongs_to :user
  has_many :choices

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
