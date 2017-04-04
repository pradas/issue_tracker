class Issue < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :kind, presence: true
  validates :priority, presence: true
end
