class Fizzbuzz
  def initialize rules
    @rules = rules
  end
​
  def check number
    result = ""
    @rules.each do |rule|
      if rule[:condition].call(number, result)
        result = rule[:modify].call(result, number)
      end
    end
    result
  end
end
​
fizz = {:condition => Proc.new {|number| number % 3 == 0},
        :modify => Proc.new{|text| text + "Fizz"}
       }
​
buzz = {:condition => Proc.new {|number| number % 5 == 0},
        :modify => Proc.new{|text| text + "Buzz"}
       }
vodafone = {:condition => Proc.new {|number| number.to_s[0] == "2"},
            :modify => Proc.new{|text| "Vodafone"}
           }
number = {:condition => Proc.new {|number, text| text == ""},
          :modify => Proc.new{|text, number| number}
         }
rules = [fizz, buzz, vodafone, number]
​
​
fizzbuzz = Fizzbuzz.new(rules)
​
(1..100).each do |n|
  puts fizzbuzz.check(n)
end