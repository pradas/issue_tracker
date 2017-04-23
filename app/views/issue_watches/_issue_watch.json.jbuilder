json.extract! issue_watch, :id, :user, :issue, :created_at, :updated_at
json.url issue_watch_url(issue_watch, format: :json)
