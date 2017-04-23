class Issue < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :kind, presence: true
  validates :priority, presence: true
end
