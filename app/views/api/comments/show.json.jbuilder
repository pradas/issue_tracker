json.id @comment.id
json.text @comment.content
json.created_at @comment.created_at
json.user @comment.user.name
json.user_id @comment.user_id