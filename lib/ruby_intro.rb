# When done, submit this entire file to the autograder.

# Part 1
#Define a method sum(array) that takes an array of integers as an argument and returns the sum of its elements. 
#For an empty array it should return zero. 
#Run associated tests via: $ rspec spec/part1_spec.rb:5
def sum arr
 arr.inject 0, :+
end

#Define a method max_2_sum(array) which takes an array of integers as an argument and returns the sum of its two largest elements.
#For an empty array it should return zero. 
#For an array with just one element, it should return that element. 
#Run associated tests via: $ rspec spec/part1_spec.rb:23
=begin
def max_2_sum arr
 return 0 if arr.empty? 
 return arr[0] if arr.length==1
  sum(arr.sort.last(2))
end
=end
def max_2_sum arr
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  maximum, max_index = arr[0], 0
  arr.each_with_index do |element, index|
    if element >= maximum
      maximum = element
      max_index = index
    end
  end
  
  maximum, second_max_index = -1/0.0, 0
  arr.each_with_index do |element, index|
    if element >= maximum && index != max_index
      maximum = element
      second_max_index = index
    end
  end
  arr[max_index] + arr[second_max_index]
end

#puts max_2_sum [1,2,3]
#Define a method sum_to_n?(array, n) that takes an array of integers and an additional integer, n, as arguments and returns true if any two elements in the array of integers sum to n.
#sum_to_n?([], n) should return false for any value of n, by definition.
#Run associated tests via: $ rspec spec/part1_spec.rb:42
def sum_to_n? arr, n
  return false if arr.empty?
  arr.combination(2).any? {|a,b| a+b==n}
  
end

#You can check your progress on the all the above by running $ rspec spec/part1_spec.rb.

# Part 2
#Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with the name.
#Run associated tests via: $ rspec -e '#hello' spec/part2_spec.rb

def hello(name)
  "Hello, #{name}"
end

#Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.)
#NOTE: be sure it works for both upper and lower case and for nonletters!
#Run associated tests via: $ rspec -e '#starts_with_consonant?' spec/part2_spec.rb
def starts_with_consonant? s
  return s[0] =~ /[b-df-hj-p-tv-z]/i
end

#Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number that is a multiple of 4. 
#NOTE: be sure it returns false if the string is not a valid binary number!
#Run associated tests via: $ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb

def binary_multiple_of_4? s
  #0, 100, 1000, 1100, 10000, 10100
  s =~ /^[01]+$/ && s.to_i(2) % 4 == 0
end
#You can check your progress on the all the above by running $ rspec spec/part2_spec.rb.

# Part 3
#Define a class BookInStock which represents a book with an ISBN number, isbn, and price of the book as a floating-point number, price, as attributes.
#Run associated tests via: $ rspec -e 'getters and setters' spec/part3_spec.rb

class BookInStock
#The constructor should accept the ISBN number (a string, since in real life ISBN numbers can begin with zero and can include hyphens) as the first argument and price as second argument,
#and should raise ArgumentError (one of Ruby's built-in exception types) 
#if the ISBN number is the empty string or if the price is less than or equal to zero.
#Include the proper getters and setters for these attributes. 
#Run associated tests via: $ rspec -e 'constructor' spec/part3_spec.rb

  attr_accessor :isbn, :price
  
  def initialize isbn, price
    raise ArgumentError if isbn.empty? || price <= 0
    @isbn = isbn
    @price = price
  end


#Include a method price_as_string that returns the price of the book formatted with a leading dollar sign and two decimal places,
#that is, a price of 20 should format as "$20.00" and a price of 33.8 should format as "$33.80".
#Run associated tests via: $ rspec -e '#price_as_string' spec/part3_spec.rb
def price_as_string
  #"%0.2f" % @price => 
  "$#{"%0.2f" % @price}"
end
end
#You can check your progress on the all the above by running rspec spec/part3_spec.rb.