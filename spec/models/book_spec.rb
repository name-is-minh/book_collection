require "rails_helper"

RSpec.describe Book, type: :model do
  it "saves a book with a title" do
    book = Book.new(title: "test67")
    expect(book.save).to be true
  end

  it "doesnt save a book that has a blank title" do
    book = Book.new(title: "")
    expect(book.save).to be false
  end

  it "saves a book with an author" do
    book = Book.new(title: "frieren", author: "Yamada")

    expect(book.save).to be true
    expect(book.author).to eq("Yamada")
  end

  it "saves a book with a price" do
    book = Book.new(title: "frieren", price: 0.99)

    expect(book.save).to be true
    expect(book.price.to_f).to eq(0.99)
  end

  it "saves a book with a published date" do
    date = Date.new(1000, 1, 1)
    book = Book.new(title: "frieren", published_date: date)

    expect(book.save).to be true
    expect(book.published_date).to eq(date)
  end
end