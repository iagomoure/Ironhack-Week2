require 'rspec'

class EmailProviderFake

  def initialize subject
    @subject = subject
  end

  def get_subjects
    @subject
  end
end


class WordChecker
  
  def initialize(subject_provider)
    @subject_provider = subject_provider
  end

  def check words
    subjects = @subject_provider.get_subjects
    words.reduce(true) do |result, word|
      result && provider_subjects.any? {|subject| subject.include?(word)}
    end
  end
end


RSpec.describe "Word counter" do 

  describe "Email provider has no strings" do
	
    it "should return true if no words given" do
      #con FAKE
		  provider = EmailProviderFake.new([]) 
      #con STUB
      #provider = instance_double("EmailProviderFake", :get_subjects => [])
		  counter = WordChecker.new(provider)
		  expect(counter.check([])).to eq(true)
	 end

    it "should return false when a word is included in a subject" do
      #con FAKE
      #provider = EmailProviderFake.new([])
      #con STUB
      provider = instance_double("EmailProviderFake", :get_subjects => [])
      counter = WordChecker.new(provider)
      expect(counter.check(["hola"])).to eq(false)
    end
  end

  describe "Email provider has string" do

    it "should return true when a word is included in a subject" do
      #con FAKE
      #provider = EmailProviderFake.new(["hola"])
      #con STUB
      provider = instance_double("EmailProviderFake", :get_subjects => ["hola"])
      counter = WordChecker.new(provider)
      expect(counter.check(["hola"])).to eq(true)
    end

    it "should return true when a word is included in a subject" do
      #con FAKE
      #provider = EmailProviderFake.new(["hola"])
      #con STUB
      provider = instance_double("EmailProviderFake", :get_subjects => ["hola","que","tal estas tu"])
      counter = WordChecker.new(provider)
      expect(counter.check(["hola","estas","un"])).to eq(true)
    end
  end
end
	



	