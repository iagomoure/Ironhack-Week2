class StringCalculator
	
	def add numbers_str
		num_arr = numbers_str.split(",")
		num1 = num_arr[0].to_i || 0
		num2 = num_arr[1].to_i || 0
		num1 + num2
	end
end

calc = StringCalculator.new.add("1,2")
#TESTING
if calc == 3
	puts "work"
else
	puts "No work"
end

