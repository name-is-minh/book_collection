require "rails_helper"

RSpec.describe Book, type: :model do
  it "saves a book and shows the correct flash notice" do
    book = Book.new(title: "test67")
    expect(book.save).to be true
  end

  it "doesnt save a book that has a blank title and shows the correct flash notice" do
    book = Book.new(title: "")
    expect(book.save).to be false
  end
end