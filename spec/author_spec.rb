require "./lib/book"
require "./lib/author"

RSpec.describe Author do
  describe "#initialize" do
    it "exists" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      
      expect(charlotte_bronte).to be_a(Author)
    end
  end
  
  describe "#name" do
    it "returns author name" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end
  end
  
  describe "#book" do
    it "returns array of author's books" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      
      expect(charlotte_bronte.books).to eq([])
    end
  end
  
  describe "write" do
    it "adds book object to author" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(jane_eyre.class).to eq(Book)

      expect(jane_eyre.title).to eq("Jane Eyre")

      villette = charlotte_bronte.write("Villette", "1853")

      expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end
end