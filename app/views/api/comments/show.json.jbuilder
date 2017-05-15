json.id @comment.id
json.text @comment.content
json.created_at @comment.created_at
json.user @comment.user.name
json.user_id @comment.user_id
json._link do
  json.user do
    json.href "/api/users/"+@comment.user_id.to_s
  end
  json.issue do
    json.href "api/issues/"+@comment.issue_id.to_s
  end
end