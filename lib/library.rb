class Library
  attr_reader :name,
              :books,
              :authors
              
  def initialize(name)
    @name = name
    @books = []
    @authors = []
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
end