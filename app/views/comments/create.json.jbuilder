json.text  @comment.text
json.created_at @comment.created_at.in_time_zone('Tokyo').strftime("%Y/%m/%d %H:%M")
json.user_name  @comment.user.nickname
json.id @comment.id