def hasPeak?(array)
  puts array.inspect
  n = array.length
  if n == 1
    return false
  elsif(array[n/2] < array[(n/2) - 1])
    hasPeak?(array[0..(n/2)-1])
  elsif(array[n/2] < array[(n/2) + 1])
    hasPeak?(array[(n/2)+1..n-1])
  else
    return true
  end
end
