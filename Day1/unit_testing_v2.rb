class StringCalculator
	
	def initialize numbers_str
		@numbers_str = numbers_str
	end

	def sum_digits
		@numbers_str = @numbers_str.split(",")
		result = 0
		@numbers_str.each do |digit|
			result += digit.to_i
		end
		result
	end
	

end

#TESTING
calc = StringCalculator.new("").sum_digits
if calc == 0
	puts "work"
else
	puts "No work"
end
calc = StringCalculator.new("1").sum_digits
if calc == 1
	puts "work"
else
	puts "No work"
end
calc = StringCalculator.new("1,2").sum_digits
if calc == 3
	puts "work"
else
	puts "No work"
end

calc = StringCalculator.new("1,2,1").sum_digits
if calc == 4
	puts "work"
else
	puts "No work"
end
