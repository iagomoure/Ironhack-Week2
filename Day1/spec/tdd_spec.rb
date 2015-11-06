require_relative '../tdd.rb'
RSpec.describe "Fizzbuzz" do

  before :each do
    @number = Fizzbuzz.new
  end

  it "return 1 for 1" do
    expect(@number.validate(1)).to eq(1)
  end

  it "return 2 for 2" do
    expect(@number.validate(1)).to eq(1)
  end

  it "return Fizz for 3" do
    expect(@number.validate(3)).to eq("Fizz")
  end

  it "return number for a number no mod 3 or 5" do
    expect(@number.validate(4)).to eq(4)
  end

  it "return Buzz for 5 " do
    expect(@number.validate(5)).to eq("Buzz")
  end

  it "return FizzBuzz for 15" do
    expect(@number.validate(15)).to eq("FizzBuzz")
  end

  it "return FizzBuzz for a number mod 3 and mod 5" do
    expect(@number.validate(30)).to eq("FizzBuzz")
  end

  it "return Nike form 7" do
    expect(@number.validate(7)).to eq("Nike")
  end

  it "return Nike form number mod 7" do
    expect(@number.validate(14)).to eq("Nike")
  end

   it "return Vodafone when number 2" do
    expect(@number.validate(2)).to eq("Vodafone")
  end

  it "return Vodafone when number 20" do
    expect(@number.validate(20)).to eq("Vodafone")
  end

  it "return Vodafone when number starts with 2" do
    expect(@number.validate(22)).to eq("Vodafone")
  end

end