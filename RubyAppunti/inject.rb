result = [2, 3, 4].inject(1) { |sum, item| sum + item }
puts result

    result2 = [2, 3, 4].inject(0) { |product, item| product * item }
puts result2