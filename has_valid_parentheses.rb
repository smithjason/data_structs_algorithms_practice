def has_valid_parens?(string)
  count = 0
  string.each_char do |char|
    if char == '('
      count += 1
    elsif char == ')'
      count -= 1
    end
    return false if count < 0
    puts "COUNT - #{count}"
  end
  count == 0
end
