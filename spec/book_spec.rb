require "./lib/book"

RSpec.describe Book do
  describe "#initialize" do
    it "exists" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      
      expect(book).to be_a(Book)
    end
  end
  
  describe "#title" do
    it "returns book title" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      
      expect(book.title).to eq("To Kill a Mockingbird")
    end
  end
  
  describe "#author" do
    it "returns the book's author" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
      
      expect(book.author).to eq("Harper Lee")
    end
  end
  
  describe "#publication_year" do
    it "returns book's publication year" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

      expect(book.publication_year).to eq("1960")
    end
  end

  describe "#increase_times_checked" do
    it "returns the amount of times the book has been checked" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

      expect(book.times_checked).to eq(0)

      book.increase_times_checked
      book.increase_times_checked

      expect(book.times_checked).to eq(2)
    end
  end
end