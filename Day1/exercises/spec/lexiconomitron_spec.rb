require_relative '../lexiconomitron.rb'

RSpec.describe Lexiconomitron do 

  let (:lexi) { Lexiconomitron.new }

  describe "#eat_t" do
    
    it "nil from the string input" do
      expect(lexi.eat_t("")).to eq("")
    end
    
    it "hola from the string input" do
      expect(lexi.eat_t("hola")).to eq("hola")
    end
 
    it "t in the string input" do
      expect(lexi.eat_t("t")).to eq("")
    end

    it "great scott in the string input" do
      expect(lexi.eat_t("great scott")).to eq("grea sco")
    end

    it "great scott! in the string input" do
      expect(lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do

  	it "empty array from empty array" do
  		expect(lexi.shazam([])).to eq([nil,nil])
  	end

  	it "fully shazam from array" do
  		expect(lexi.shazam(["hola","que","tal"])).to eq(["la","aloh"])
  	end
  end

  describe "#reverse" do

  	it "empty array form empty array" do
  		expect(lexi.reverse([])).to eq([])
  	end

  	it "array reverse with reverse words form array" do
  		expect(lexi.reverse(["hola","que","tal"])).to eq(["lat","euq","aloh"])
  	end  	
  end

  describe "#firstlast" do

  	it "empty array form empty array" do
  		expect(lexi.firstlast([])).to eq([nil,nil])
  	end
	 
    it "array with only first and last element form an array" do
  		expect(lexi.firstlast(["lat","euq","aloh"])).to eq(["lat","aloh"])
  	end	
  end

  describe "#oompa_loompa" do

    it "empty array from empty array" do
      expect(lexi.oompa_loompa([])).to eq([])
    end

    it "array which size is three characters of less in the same order from array" do
      expect(lexi.oompa_loompa(["you","wanna","be","my","lover"])).to eq(["you","be","my"])
    end    
  end

end