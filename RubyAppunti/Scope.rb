$x = 2
x = 3

loopcounter = 10
_LoopCounter = 20

puts x, $x
puts $0, $$, $?

def displaystrings(*args)
	args.each { |string| puts string }
end

displaystrings("Red", "Green")