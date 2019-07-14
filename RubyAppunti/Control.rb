count = 3
tries = count

if count > 10
  puts "Try again"
elsif tries == 3
  puts "You lose"
else
  puts "Enter a number"
end

weight = 0
numPallets = 0
pallet = 0

def nextPallet
	pallet = 10
	return pallet
end

while weight < 100 and numPallets <= 30
  pallet = nextPallet()
  weight += pallet
  numPallets += 1
  puts numPallets
end

