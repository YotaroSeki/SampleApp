User.create!(name: '芽兎めう', email: 'example@railstutorial.org', password: 'foobar', password_confirmation: 'foobar', admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# relationship
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
microposts = Micropost.all
liked_microposts = microposts[2..50]
liked_micropost = microposts.first
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
liked_microposts.each { |micropost| user.favorite(micropost) }
following.each { |a_user| a_user.favorite(liked_micropost) }
