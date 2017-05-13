
json.issues @issues do |issue|
  json.id issue.id
  json.title issue.title
  json.description issue.description
  json.user_id issue.user_id
  json.kind issue.kind
  json.priority issue.priority
  json.created_at issue.created_at
  json.updated_at issue.updated_at
  json.status issue.status
  json.votes issue.votes
  json.watchers issue.watchers
end