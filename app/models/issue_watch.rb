class IssueWatch < ApplicationRecord
    belongs_to :user
    belongs_to :issue
end