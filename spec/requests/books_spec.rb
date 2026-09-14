require "rails_helper"

RSpec.describe "Books", type: :request do
  it "saves a book and shows the correct flash notice" do
    post books_path, params: { book: { title: "test67" } }

    expect(Book.last.title).to eq("test67")
    expect(response).to redirect_to(books_path)
  end

  it "doesnt save a book that has a blank title and shows the correct flash notice" do
    count = Book.count

    post books_path, params: { book: { title: "" } }

    expect(Book.count).to eq(count)
  end
end