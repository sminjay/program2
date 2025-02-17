# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Administrator.create!(username: "admin", name: "SJS", email: "sjs@cinepack.com", password: "password242511", password_confirmation: "password242511")

Movie.create!(title: "Inception", genre: "Sci-Fi", duration: 148, language: "English", rating: "PG-13", release_date: "2010-07-16")
