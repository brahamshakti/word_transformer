require_relative './lib/word_validation'
require_relative './lib/transformer'

start_word = nil
end_word = nil
words = nil

word_validation = WordValidation.new(start_word, end_word)

while !word_validation.validate_start_word?(start_word)
  puts "Please enter the start word and the size of start word should be greater than or equal to #{WordValidation::MIN_SIZE} and less than or equal to #{WordValidation::MAX_SIZE}: "
  start_word = gets.chomp
end

while !word_validation.validate_end_word?(end_word)
  puts 'Please enter the end word, the size of end word should match the size of start word: '
  end_word = gets.chomp
end

while !word_validation.validate_words?(words)
  puts 'Please enter the comma separated approved words'
  words = gets.chomp
end

transformer = Transformer.new(word_validation.approved_words)
transformer.add_unidirectional_edges
length = transformer.bfs(word_validation.start_word, word_validation.end_word)
puts "The shortest transformation length is : #{length}"

exit