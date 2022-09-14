# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
User.destroy_all # if Rails.en.development
Artist.destroy_all
Concert.destroy_all

User.create!(
  first_name: "Music",
  last_name: "Mates",
  email: "music@mates.com",
  password: "123456",
  location: "Melbourne"
)
puts "Created User: Music Mates, Email: music@mates.com, Password: 123456."

location = ["Melbourne", "Canberra", "Brisbane", "Hobart", "Sydney"]
venue = ["MCG", "The Pub", "Your Backyard", "Sydney Opera House", "McDonald's"]

5.times do
  artist = Artist.new(
    name: Faker::Kpop.girl_groups
  )
  artist.save
  puts "Created #{artist.name}"
  concert = Concert.new(
    date: Date.today,
    location: location.sample,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    venue: venue.sample,
    artist: artist
  )
  concert.save
  puts "Created #{concert.artist.name}'s concert on #{concert.date} at #{concert.date}, #{concert.venue}."
end

hunter = User.create(
  first_name: "Hunter",
  last_name: "Shark",
  location: "Sydney",
  email: "hunter@chomp.com",
  password: "123456"
)
puts "#{hunter.first_name}"

follow = Follow.create(
  artist: Artist.first,
  user: hunter
)

puts "#{hunter.first_name} follows !"

group = Group.create(
  concert: Concert.first
)

invite = Invitation.create(
  user: hunter,
  group: group,
  status: 1
)


puts "Done!"
