User.create(
  name: "Anh Tài",
  email: "nqat2003@gmail.com",
  role: 1,
  password: "123456",
  password_confirmation: "123456"
)
20.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    password: "123456",
    password_confirmation: "123456"
  )
end

Topic.create(
  content: "Games"
)

Topic.create(
  content: "Reviews"
)

10.times do
  Topic.create(
    content: Faker::Game.unique.title,
    topic_id: Faker::Number.between(from: 1, to: 2),
  )
end

50.times do
  Post.create!(
    subject: Faker::Esport.event,
    topic_id: Faker::Number.within(range: Topic.ids),
    content: Faker::Lorem.paragraph_by_chars,
    user_id: Faker::Number.within(range: User.ids),
    view_count: Faker::Number.between(from: 50, to: 500),
    status: Faker::Number.between(from: 0, to: 1)
  )
end

50.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    post_id: Faker::Number.within(range: Post.ids),
    user_id: Faker::Number.within(range: User.ids)
  )
end

50.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    post_id: Faker::Number.within(range: Post.ids),
    user_id: Faker::Number.within(range: User.ids),
    comment_id: Faker::Number.within(range: Comment.ids)
  )
end
