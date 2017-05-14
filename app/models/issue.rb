class Issue < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :issue_votes
  has_many :issue_watches
  has_many :resumes
  
  validates :title, presence: true
  validates :user_id, presence: true
  validates :kind, presence: true
  validates :priority, presence: true
end
