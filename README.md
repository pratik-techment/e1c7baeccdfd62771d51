List tweet URL
get http://localhost:3000/users/1/feed

profile URL
get http://localhost:3000/users/1/profile

Follow
post http://localhost:3000/users/1/relationships?followed_id=2

unfollow
delete http://localhost:3000/users/1/relationships?followed_id=2
