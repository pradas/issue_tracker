json.extract! issue_vote, :id, :user, :issue, :created_at, :updated_at
json.url issue_vote_url(issue_vote, format: :json)
