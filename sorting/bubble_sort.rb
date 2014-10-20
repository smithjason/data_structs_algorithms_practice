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
