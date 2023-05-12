# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning the db....'
List.destroy_all
Movie.destroy_all
Bookmark.destroy_all

puts "Creating Lists"
5.times do
  List.create!(
    name: "#{Faker::Book.genre} #{Faker::Lorem.word.capitalize}"
  )
end

puts "Creating Movies"
15.times do |i|
  Movie.create!(
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    rating: rand(1..6),
    poster_url: "http://source.unsplash.com/featured/?cinema>&#{i}"
  )
end

puts "Making Bookmark"
m_list = Movie.all.each_slice(3).to_a
l_list = List.all
l_list.each_with_index do |li, idx|
  m_list[idx].each do |m|
    Bookmark.create!(
      comment: Faker::Books::Lovecraft.sentence,
      movie: m,
      list: li
    )
  end
end
