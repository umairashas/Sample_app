# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find(22)

1000.times do
	Todo.create!(
  title: Faker::Lorem.sentence(word_count: 10),
  completed: Faker::Boolean.boolean,  
  user_id: user.id,
  status: 'pending'
)

puts "Fake Todo created for User ID #{user.id}"
end