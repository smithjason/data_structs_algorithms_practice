=begin

Speed: O(n^2)
Space: O(1)

Good
  - On short lists
  - For sorting on the fly as you receive data
  - After i iterations, the first i items are in order

Bad
  - Only good for small data sets

=end

def insertion_sort(list)
  for i in 1..list.length - 1
    value = list[i]
    j = i - 1

    while(j >= 0 && list[j] > value) do
      list[j], list[j+1] = list[j+1], list[j]
      j -= 1
    end
  end
  list
end

unsorted = [4, 2, 8, 3, 1]
unsorted2 = [3, 1, 7, 2, 5]
unsorted3 = [10, 3, 2, 35, 23, 6, 5]
p insertion_sort(unsorted) # => [1, 2, 3, 5, 7]
p insertion_sort(unsorted2) #=> [2, 3, 5, 6, 10, 23, 35]
p insertion_sort(unsorted3) #=> [1, 2, 3, 4, 8]
