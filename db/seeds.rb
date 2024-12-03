# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(name: "Ginger", email: "ginger@example.com", password: "password")
User.create(name: "Garlic", email: "garlic@example.com", password: "password")

NotesCategory.create(name: "Personal")
NotesCategory.create(name: "Work")
NotesCategory.create(name: "Other")

Note.create(title: "My First Note", description: "This is a test note", user: User.first, notes_category: NotesCategory.first)
Note.create(title: "My Second Note", description: "This is a test note", user: User.last, notes_category: NotesCategory.last)
