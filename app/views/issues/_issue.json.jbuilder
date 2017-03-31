json.extract! issue, :id, :title, :description, :user_id, :kind, :priority, :created_at, :updated_at
json.url issue_url(issue, format: :json)
