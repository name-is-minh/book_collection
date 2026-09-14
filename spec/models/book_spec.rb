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
end