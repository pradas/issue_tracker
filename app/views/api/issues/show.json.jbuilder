json.id @issue.id
json.title @issue.title
json.description @issue.description
json.user @issue.user.name
json.user_id @issue.user_id
json.kind @issue.kind
json.priority @issue.priority
json.created_at @issue.created_at
json.updated_at @issue.updated_at
json.status @issue.status
json.votes @issue.issue_votes.count
json.votes_user @issue.issue_votes do |vote|
  json.user vote.user.name
end
json.watchers @issue.issue_watches.count
json.comments @issue.comments do |comment|
  json.id comment.id
  json.text comment.content
  json.created_at comment.created_at
  json.user comment.user.name
  json.user_id comment.user_id
end
json.attachments @issue.resumes do |resume|
  json.id resume.id
  json.name resume.name
  json.attachment resume.attachment.url
  json.user resume.user.name
  json.user_id resume.user_id
end
json._link do
  json.user do
    json.href "/api/users/"+@issue.user_id.to_s
  end
end