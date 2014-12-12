def largest_diff_in_array(numbers)
  length = numbers.length
  return 0 if length < 1

  highest_number, result = 0, 0

  numbers.reverse_each do |number|
    highest_number = number if number > highest_number
    temp_max_difference = highest_number - number
    result = temp_max_difference if temp_max_difference > result
    print "Number: #{number} - "
    print "Highest: #{highest_number} - "
    print "Temp Max Diff: #{temp_max_difference} - "
    print "Result: #{result} \n"
  end

  result
end

ints = [3, -5, 1, -2, 8, -2, 3, -2, 1]

puts largest_diff_in_array(ints) # 13
