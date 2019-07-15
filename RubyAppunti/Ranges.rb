# Ruby Ranges allow data to be represented in the form of a range

1..10    # Creates a range from 1 to 10 inclusive
1...10   # Creates a range from 1 to 9

array = (1..10).to_a
arrayletter = ('a'..'z').to_a
puts array 
puts arrayletter

puts array.min
puts array.include?(2)

#array.each {|number} puts "number " + number}