require "rails_helper"

RSpec.describe "Books", type: :request do
  it "saves a book and shows the correct flash notice" do
    post books_path, params: { book: { title: "test67" } }

    expect(Book.last.title).to eq("test67")
    expect(response).to redirect_to(books_path)

    follow_redirect!

    expect(response.body).to include("Book was successfully created.")
  end

  it "doesnt save a book that has a blank title and shows the correct flash notice" do
    count = Book.count

    post books_path, params: { book: { title: "" } }

    expect(Book.count).to eq(count)
    expect(response).to have_http_status(:unprocessable_content)
    expect(response.body).to include("Title can&#39;t be blank")
  end

  it "saves a book with an author" do
    post books_path, params: {
      book: {
        title: "frieren",
        author: "Yamada"
      }
    }

    expect(response).to redirect_to(books_path)
    expect(Book.last.author).to eq("Yamada")
  end

  it "saves a book with a price" do
    post books_path, params: {
      book: {
        title: "frieren",
        price: 0.99
      }
    }

    expect(response).to redirect_to(books_path)
    expect(Book.last.price.to_f).to eq(0.99)
  end

  it "saves a book with a published date" do
    post books_path, params: {
      book: {
        title: "frieren",
        published_date: "1000-01-01"
      }
    }

    expect(response).to redirect_to(books_path)
    expect(Book.last.published_date).to eq(Date.new(1000, 1, 1))
  end
end