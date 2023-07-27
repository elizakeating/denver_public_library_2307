class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books
              
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    dates = author.books.map do |book|
      book.publication_year.to_i
    end
    sorted_dates = dates.sort
    time_frame = {:start => sorted_dates.first.to_s, :end => sorted_dates.last.to_s}
  end

  def checkout(book)
    @checked_out_books << book
    book.increase_times_checked
  end

  def return(book)
    book_index = @checked_out_books.index(book)
    @checked_out_books.delete_at(book_index)
  end

  def most_popular_book
    ranking = books.sort_by do |book|
      book.times_checked
    end

    ranking.last
  end
end