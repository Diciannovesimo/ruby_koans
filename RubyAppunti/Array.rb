#array
a = [1, "cat", 3, 5.55, 'test']
puts a[0]
puts a[-1]
puts a[-2]
puts a[-3]
puts a[-4]
puts a[-5]
puts a[-6]
puts a[5]

empty1 = []
empty2 = Array.new()

a = %w{ ant bee cat dog elk }
puts a[0]
puts a[-1]


instSection = {
  'cello'     => 'string',
  'clarinet'  => 'woodwind',
  'drum'      => 'percussion',
  'oboe'      => 'woodwind',
  'trumpet'   => 'brass',
  'violin'    => 'string'
}

puts instSection['oboe']

puts a.length

b = [0, 1]
b[0] += 1
b[0] += 1

puts b[0]

c = [3, 3, 1, 2, 5, 5]
b = c.sort.uniq.length
puts "test b"
puts b
puts "test c"
puts c