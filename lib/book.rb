class Book
  attr_reader :title,
              :author,
              :publication_year,
              :times_checked

  def initialize(data)
    @title = data[:title]
    @author = "#{data[:author_first_name]} #{data[:author_last_name]}"
    @publication_year = data[:publication_date].split(" ").last
    @times_checked = 0
  end

  def increase_times_checked
    @times_checked += 1
  end
end