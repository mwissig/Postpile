  require 'faker'

Post.create(
  user_id: 1,
    title: 'Test',
    body: 'Test post!',
image_url: 'test.jpg'
  )


  3.times do
    User.create(
      username: Faker::Pokemon.name,
      avatar_url: Faker::Avatar.image,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end
