# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

books = [
  {
    title: "aot",
    author: "jp",
    price: 1.99,
    published_date: Date.new(2000, 2, 2)
  },
  {
    title: "csm",
    author: "peak",
    price: 1.99,
    published_date: Date.new(1230, 1, 1)
  },
  {
    title: "t1",
    author: "kr",
    price: 2.99,
    published_date: Date.new(2014, 10, 9)
  },
  {
    title: "goat",
    author: "messi",
    price: 10.00,
    published_date: Date.new(1945, 6, 24)
  },
  {
    title: "sleep",
    author: "me",
    price: 0.99,
    published_date: Date.new(2026, 9, 15)
  }
]

books.each do |attributes|
  book = Book.find_or_initialize_by(title: attributes[:title])
  book.update!(attributes)
end