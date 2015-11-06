require 'rspec'

class StringCalculator
	
	def initialize numbers_str
		@numbers_str = numbers_str
	end

	def sum_digits
		@numbers_str = @numbers_str.gsub("\n",",").split(",")
		result = 0
		@numbers_str.reduce(0) do |memo,digit|
			memo + digit.to_i
		end
		result
	end
	

end

#UNIT TEST :: RSPEC
calc = StringCalculator.new("").sum_digits
RSpec.describe "String calculator" do
	it "returns 0 for the empty string" do
		expect(StringCalculator.new("").sum_digits).to eq(0)
	end

	it "returns 3 for only that number" do
		expect(StringCalculator.new("3").sum_digits).to eq(3)
	end

	it "returns 3 for only that number" do
		expect(StringCalculator.new("1,2").sum_digits).to eq(3)
	end

	it "returns 4 for only that number" do
		expect(StringCalculator.new("1,2,1").sum_digits).to eq(4)
	end

	it "returns 4 for only that number" do
		expect(StringCalculator.new("1\n2,1").sum_digits).to eq(4)
	end
end





