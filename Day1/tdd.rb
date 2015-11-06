require 'RSpec'

class Fizzbuzz
  def validate number
    if number%3 == 0 && number%5 == 0
      return "FizzBuzz"
    elsif number%7 == 0
      return "Nike"
    elsif number.to_s.start_with?"2"
      return "Vodafone"
    elsif number%3 == 0
      return "Fizz"
    elsif number%5 == 0
      return "Buzz"
    else
      number
    end
  end
end

