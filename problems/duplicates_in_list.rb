def find_duplicates(list)
  return_duplicate_values(count_occurances(list))
end

def count_occurances(list)
  bucket = Hash.new(0)
  list.each { |integer| bucket[integer] += 1 }
  bucket
end

def return_duplicate_values(hash)
  hash.select{ |key, value| value > 1 }.keys
end
