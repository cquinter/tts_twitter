# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

@user = User.create!(
  name: "Chrissy Q",
  username: "cquinter",
  email: "chrissyquinter@gmail.com",
  city: "New Albany",
  state: "Ohio",
  bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  password: "Teacher26",
  password_confirmation: "Teacher26"
)

@user.avatar = Rails.root.join("app/assets/images/profile-pic.jpg").open

10.times do
  @user.tweets.create(
    message: Faker::Lorem.paragraph,
    created_at: Faker::Time.between(25.days.ago, Time.now, :all)
  )
end

@user.save!

puts "Generating Users"

10.times do |i| #i here is the number of the current iteration of the 20 times (we did this so that we could refer to it in the avatar line below since the pictures are numbered 1 through 20)

  putc "."

  password = Faker::Internet.password(6)

  u = User.create!(
    name: Faker::Name.name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    city: Faker::Address.city,
    state: Faker::Address.state,
    bio: Faker::Lorem.paragraph,
    password: password,
    password_confirmation: password
  )

  u.avatar = Rails.root.join("app/assets/images/stock-profile-#{i + 1}.jpg").open

  10.times do
    u.tweets.create(
      message: Faker::Lorem.paragraph,
      created_at: Faker::Time.between(25.days.ago, Time.now, :all)
    )
  end

  u.save!

end

puts " "

7.times do
  u = User.all.sample
  unless u.id == @user.id
    puts "Following @#{u.username}"
    @user.following.push(u.id.to_s)
  end
end

@user.save!

puts " "
