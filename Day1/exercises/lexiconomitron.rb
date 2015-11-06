require 'rspec'
class Lexiconomitron 
	
  def eat_t string
		string.gsub("t",'')
  end

  def shazam array
    reverse(array)
    array.map!{ |elemnt| eat_t(elemnt)}
    firstlast(array)
  end

  def reverse array
   array.reverse!
   array.map!{|word| word.reverse}
  end

  def firstlast array
    result = []
    result << array.first
    result << array.last
    return result
  end

  def oompa_loompa array
    array_oompa = []
    array.each do |element|
      if element.size <= 3
        array_oompa << eat_t(element)
      end 
    end
    return array_oompa
  end
  
end

