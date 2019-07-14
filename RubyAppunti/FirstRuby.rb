puts "puts"
print "print"
printf "printf\n"
def sayGoodnight(name)
	result = "Goodnight, " + name
	return result
end

# Time for bed
puts sayGoodnight("William")

def sayGoodnight(name)
  result = "Goodnight, #{name}"
  return result
end

puts sayGoodnight("William")

name = true
name = "hello"
puts name

