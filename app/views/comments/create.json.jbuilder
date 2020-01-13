json.text  @comment.text
json.day  @comment.created_at.in_time_zone('Tokyo').strftime("%Y/%m/%d %H:%M")
json.user_id  @comment.user.id
json.user_name  @comment.user.nickname
json.id @comment.id