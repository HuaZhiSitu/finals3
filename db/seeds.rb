# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Clear existing data (optional, useful for development)
User.destroy_all
Skin.destroy_all
Bid.destroy_all

# Create sample users
users = User.create!([
  { username: 'Alice', email: 'alice@example.com', password: 'password' },
  { username: 'Bob', email: 'bob@example.com', password: 'password' },
  { username: 'Charlie', email: 'charlie@example.com', password: 'password' },
  { username: 'Georgie', email: 'george@example.com', password: 'password' }
])

# Create sample skins
skins = Skin.create!([
  { name: 'Dragon Lore', description: 'Rare sniper rifle skin', image_url: 'https://example.com/dragon_lore.jpg', starting_price: 1500 },
  { name: 'Fade Knife', description: 'Legendary knife skin', image_url: 'https://example.com/fade_knife.jpg', starting_price: 800 },
  { name: 'Hyper Beast', description: 'Exotic rifle skin', image_url: 'https://example.com/hyper_beast.jpg', starting_price: 500 }
])

# Create sample bids
bids = Bid.create!([
  { user_id: users[0].id, skin_id: skins[0].id, amount: 16 },
  { user_id: users[1].id, skin_id: skins[0].id, amount: 17 },
  { user_id: users[2].id, skin_id: skins[1].id, amount: 9 },
  { user_id: users[3].id, skin_id: skins[2].id, amount: 6 }
])

puts "Created #{User.count} users, #{Skin.count} skins, and #{Bid.count} bids."
