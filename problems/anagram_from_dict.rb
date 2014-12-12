file_path = "words.txt"
list_of_words = []
anagrams = Hash.new { [] }

File.foreach(file_path) do |line|
  list_of_words << line.chomp
end

list_of_words.each do |word|
  alphabetized_word = word.chars.sort.join
  if anagrams.has_key?(alphabetized_word)
    anagrams[alphabetized_word] << word
  else
    anagrams[alphabetized_word] = [word]
  end
end

anagrams.each_value do |words|
  if words.length > 1
    print words.join(', ')
    print " are all anagrams.\n"
  end
end
