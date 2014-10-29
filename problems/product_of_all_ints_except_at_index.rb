def get_products_of_all_ints_except_at_index(input_array)
  return input_array if input_array.length < 2

  input_array.map.with_index do |value, index|
    temp_array = input_array.dup
    temp_array.delete_at(index)
    temp_array.reduce(:*)
  end
end

puts get_products_of_all_ints_except_at_index([1,7,3,4]).inspect
puts get_products_of_all_ints_except_at_index([2,4,10]).inspect
puts get_products_of_all_ints_except_at_index([2]).inspect

