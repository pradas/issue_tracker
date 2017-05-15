json.comments @comments do |comment|
  json.id comment.id
  json.text comment.content
  json.created_at comment.created_at
  json.user comment.user.name
  json.user_id comment.user_id
  json._link do
    json.user do
      json.href "/example_resource"
    end
  end
end