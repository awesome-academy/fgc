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
    content: Faker::Esport.game,
    topics_id: Faker::Number.between(from: 1, to: 2)
)
end

50.times do
  Post.create(
    subject: Faker::Esport.event,
    topics_id: Faker::Number.between(from: 3, to: 10),
    content: Faker::Lorem.paragraphs,
    users_id: Faker::Number.between(from: 1, to: 20),
    view_count: Faker::Number.between(from: 50, to: 500),
    status: Faker::Number.between(from: 0, to: 1)
  )
end

50.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    posts_id: Faker::Number.between(from: 1, to: 50),
    users_id: Faker::Number.between(from: 1, to: 20)
  )
end

50.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    posts_id: Faker::Number.between(from: 1, to: 50),
    users_id: Faker::Number.between(from: 1, to: 20),
    comments_id: Faker::Number.between(from: 1, to: 50)
  )
end


