class Array
  
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i +=1      
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)
      i +=1      
    end
    self
  end

  def my_select 
    i = 0
    array_select = []
    while i < self.size
      if yield(self[i])
        array_select << self[i]
      end
    i+=1
    end 
    array_select
  end

   def my_select2
    return self unless block_given?
    new_array = []
    self.my_each{ |i| new_array << i if yield(i)}
    new_array
  end

  def my_map
    return self unless block_given?
    new_array = []
    self.my_each{ |i| new_array << yield(i)}
    new_array
  end

  def my_map2 my_block
    my_array = []
    each {|i| my_array << my_block.call(i)}
    my_array
  end
end


bloque = Proc.new {|item| item * 2}
[1,2,3,].my_map2 bloque # => [2,4,6]



array = [1,2,3,4]
array2 = ["uno", "dos", "tres"]

array.my_each do |item|
  puts "Hi"
end

array2.my_each do |numero|
  puts numero
end

array.my_each_with_index do |item, index|
  puts "#{item} con #{index}"
end

new_array = array.my_select{|num| num.even?}
puts new_array

new_array = array.my_select2{|item| item.odd?}
puts new_array

new_array = array.my_map do |numero|
  numero * 2
end
puts new_array
