# input: Array of words
# output: Array of words sorted by word length then by alphabet.
def sort_words_by_length_then_alpha(words)
  words_grouped_by_length = {}

  words.each do |word|
    length = word.length
    if words_grouped_by_length[length]
      words_grouped_by_length[length] << word
    else
      words_grouped_by_length[length] = [word]
    end
  end

  sorted_words = []

  words_grouped_by_length.sort.each do |word_group|
    sorted_words << word_group.last.sort
  end

  sorted_words.flatten
end

array_of_words = ['whatthehellisthis','dog', 'cat', 'mouse', 'elephant', 'eagle', 'cannary', 'levianthon', 'littlepiggything','birdy','fox']

puts sort_words_by_length_then_alpha(array_of_words)
