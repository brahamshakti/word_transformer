class WordValidation
  attr_accessor :start_word, :end_word, :approved_words

  MAX_SIZE = 5
  MIN_SIZE = 1
  MIN_APPROVED_WORDS_SIZE = 2
  MAX_APPROVED_WORDS_SIZE = 600

  def initialize(start_word, end_word)
    @start_word = start_word
    @end_word = end_word
  end

  def validate_start_word?(word)
    @start_word = word
    valid?(@start_word)
  end

  def validate_end_word?(word)
    @end_word = word
    valid?(@end_word) && start_word.size == end_word.size
  end

  def validate_words?(words)
    return false unless words
    @approved_words = words.split(',')
    return false unless approved_words.all?{ |word| valid?(word) }
    approved_words.length >= MIN_APPROVED_WORDS_SIZE && approved_words.length <= MAX_APPROVED_WORDS_SIZE
  end

  private

  def valid?(word)
    word && is_string?(word) && valid_size?(word)
  end

  def is_string?(word)
    word.match?(/^[A-z]+$/)
  end

  def valid_size?(word)
    size = word.size
    size <= MAX_SIZE && size >= MIN_SIZE
  end 
end