json.issues @issues do |issue|
  json.id issue.id
  json.title issue.title
  json.description issue.description
  json.user_id issue.user.name
  json.user_id issue.user_id
  json.kind issue.kind
  json.priority issue.priority
  json.created_at issue.created_at
  json.updated_at issue.updated_at
  json.status issue.status
  json.votes issue.issue_votes.count
  json.watchers issue.issue_watches.count
  json._link do
    json.user do
      json.href "/api/users/"+issue.user_id.to_s
    end
  end
end