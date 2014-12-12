# Time: O(n log n)
# Space: O(n)

def merge_sort(list)
  return list if list.length <= 1

  middle = list.length / 2
  left = merge_sort(list[0..middle-1])
  right = merge_sort(list[middle..list.length])
  merge(left, right)
end

def merge(first, second)
  first_index = 0
  second_index = 0
  combined = []

  while first_index < first.length and second_index < second.length do
    if first[first_index] <= second[second_index]
      combined << first[first_index]
      first_index += 1
    else
      combined << second[second_index]
      second_index += 1
    end
  end

  if first_index < first.length
    (first_index..first.length-1).each do |index|
      combined << first[index]
    end
  else
    (second_index..second.length-1).each do |index|
      combined << second[index]
    end
  end

  combined
end
