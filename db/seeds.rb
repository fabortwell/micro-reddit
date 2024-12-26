# db/seeds.rb

# Clear existing data
puts "Clearing existing data..."
Comment.destroy_all
Post.destroy_all
User.destroy_all

# Create Users
puts "Creating users..."
users = [
  {
    username: "tech_enthusiast",
    email: "tech@example.com"
  },
  {
    username: "news_junkie",
    email: "news@example.com"
  },
  {
    username: "ruby_lover",
    email: "ruby@example.com"
  },
  {
    username: "rails_master",
    email: "rails@example.com"
  },
  {
    username: "coding_ninja",
    email: "ninja@example.com"
  }
]

created_users = users.map do |user|
  User.create!(user)
end

# Create Posts
puts "Creating posts..."
posts = [
  {
    title: "Why Ruby on Rails is Still Relevant in 2024",
    url: "https://example.com/ruby-2024",
    user: created_users[0]
  },
  {
    title: "10 Must-Know Ruby Gems for Web Development",
    url: "https://example.com/ruby-gems",
    user: created_users[1]
  },
  {
    title: "Getting Started with API Development in Rails",
    url: "https://example.com/rails-api",
    user: created_users[2]
  },
  {
    title: "The Future of Web Development",
    url: "https://example.com/web-future",
    user: created_users[3]
  },
  {
    title: "Best Practices for Ruby Testing",
    url: "https://example.com/ruby-testing",
    user: created_users[4]
  },
  {
    title: "Understanding Rails Active Record",
    url: "https://example.com/active-record",
    user: created_users[0]
  }
]

created_posts = posts.map do |post|
  Post.create!(post)
end

# Create Comments
puts "Creating comments..."
comments = [
  {
    body: "Great article! Really helped me understand the concepts better.",
    user: created_users[1],
    post: created_posts[0]
  },
  {
    body: "I've been using these gems in my projects. They're amazing!",
    user: created_users[2],
    post: created_posts[1]
  },
  {
    body: "This is exactly what I needed for my new project. Thanks for sharing!",
    user: created_users[3],
    post: created_posts[2]
  },
  {
    body: "The testing practices mentioned here saved me hours of debugging.",
    user: created_users[4],
    post: created_posts[4]
  },
  {
    body: "Would love to see more content like this!",
    user: created_users[0],
    post: created_posts[3]
  },
  {
    body: "The examples are very clear and well-explained.",
    user: created_users[1],
    post: created_posts[5]
  },
  {
    body: "I implemented these practices and saw immediate improvements.",
    user: created_users[2],
    post: created_posts[4]
  },
  {
    body: "This has become my go-to reference for Rails API development.",
    user: created_users[3],
    post: created_posts[2]
  }
]

Comment.create!(comments)

puts "Seed data created successfully!"
puts "Created #{User.count} users"
puts "Created #{Post.count} posts"
puts "Created #{Comment.count} comments"
