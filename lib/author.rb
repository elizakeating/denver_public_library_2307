class Author
  attr_reader :name,
              :books

  def initialize(data)
    @name = "#{data[:first_name]} #{data[:last_name]}"
    @books = []
  end

  def write(book_name, publication_date)
    book = Book.new({author_first_name: @name.split[0], author_last_name: @name.split[1], title: book_name, publication_date: publication_date})

    @books << book
    
    book
  end
end