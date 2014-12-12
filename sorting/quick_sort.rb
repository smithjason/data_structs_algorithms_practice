=begin
  Time: O (n log n)
  Space: O (n)
=end

def quick_sort(list)
  return list if list.length <= 1

  pivot = list.sample
  list_items_less_than_pivot = list.find_all{ |i| i < pivot }
  list_items_greater_than_pivot = list.find_all{ |i| i > pivot }

  quick_sort(list_items_less_than_pivot) + [pivot] + quick_sort(list_items_greater_than_pivot)
end

unsorted = [4, 2, 8, 3, 1]
unsorted2 = [3, 1, 7, 2, 5]
unsorted3 = [10, 3, 2, 35, 23, 6, 5]
p quick_sort(unsorted) == [1, 2, 3, 4, 8]
p quick_sort(unsorted2) == [1, 2, 3, 5, 7]
p quick_sort(unsorted3) == [2, 3, 5, 6, 10, 23, 35]
