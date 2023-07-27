require "./lib/library"
require "./lib/author"
require "./lib/book"

RSpec.describe Library do
  describe "#initialize" do
    it "exists" do
      dpl = Library.new("Denver Public Library")
      
      expect(dpl).to be_a(Library)
    end
  end
  
  describe "#name" do
    it "returns name of library" do
      dpl = Library.new("Denver Public Library")
      
      expect(dpl.name).to eq("Denver Public Library")
    end
  end
  
  describe "#books" do
    it "returns library's books" do
      dpl = Library.new("Denver Public Library")
      
      expect(dpl.books).to eq([])
    end
  end
  
  describe "#authors" do
    it "returns library's authors" do
      dpl = Library.new("Denver Public Library")
      
      expect(dpl.authors).to eq([])
    end
  end
  
  describe "#add_author" do
    it "adds an author to the library" do
      dpl = Library.new("Denver Public Library")

      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")

      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    end
  end

  describe "#publication_time_frame_for" do
    it "returns earliest and latest publication dates in a hash" do
      dpl = Library.new("Denver Public Library")

        charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
        jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
        professor = charlotte_bronte.write("The Professor", "1857")
        villette = charlotte_bronte.write("Villette", "1853")

        dpl.add_author(charlotte_bronte)

        expect(dpl.publication_time_frame_for(charlotte_bronte)).to eq({:start => "1847", :end => "1857"})
    end
  end

  describe "#checked_out_books" do
    it "returns an array of books that have been checked out" do
      dpl = Library.new("Denver Public Library")

        charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
        jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
        professor = charlotte_bronte.write("The Professor", "1857")
        villette = charlotte_bronte.write("Villette", "1853")

        dpl.add_author(charlotte_bronte)

        dpl.checked_out_books.to eq([])
    end
  end

  describe "#checkout" do
    it "checks out a book" do
      dpl = Library.new("Denver Public Library")

        charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
        jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
        professor = charlotte_bronte.write("The Professor", "1857")
        villette = charlotte_bronte.write("Villette", "1853")

        dpl.add_author(charlotte_bronte)

        dpl.checkout(professor)

        expect(dpl.checked_out_books).to eq([professor])

        dpl.checkout(villette)

        expect(dpl.checked_out_books).to eq([professor, villette])
    end
  end

  describe "#return" do
    it "removes a checked out book" do
      dpl = Library.new("Denver Public Library")

        charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
        jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
        professor = charlotte_bronte.write("The Professor", "1857")
        villette = charlotte_bronte.write("Villette", "1853")

        dpl.add_author(charlotte_bronte)

        dpl.checkout(professor)
        dpl.checkout(villette)

        expect(dpl.checked_out_books).to eq([professor, villette])

        dpl.return(villette)

        expect(dpl.checked_out_books).to eq([professor])
    end
  end

  describe "most_popular_book" do
    it "returns the most popular book in the library" do
      dpl = Library.new("Denver Public Library")

        charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
        jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")    
        professor = charlotte_bronte.write("The Professor", "1857")
        villette = charlotte_bronte.write("Villette", "1853")

        dpl.add_author(charlotte_bronte)

        dpl.checkout(professor)
        dpl.checkout(villette)

        dpl.return(villette)

        dpl.checkout(jane_eyre)
        dpl.checkout(villette)

        expect(dpl.most_popular_book).to eq(villette)
    end
  end
end