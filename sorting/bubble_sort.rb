# Time: O(n^2)  :'(
# Space: O(1) :)

def bubble_sort(list)
  length = list.length
  length.times do |i|
    length.times do |j|
      if list[i] < list[j]
        temp = list[i]
        list[i] = list[j]
        list[j] = temp
      end
    end
  end
  list
end

unsorted = [3, 1, 7, 2, 5]
unsorted2 = [10, 3, 2, 35, 23, 6, 5]
p bubble_sort(unsorted) # => [1, 2, 3, 5, 7]
p bubble_sort(unsorted2) #=> [2, 3, 5, 6, 10, 23, 35]
