# frozen_string_literal: true

class CaesarCipher
  # Upper case - ASCII: 65 -> 90
  # Lower case - ASCII: 97 -> 122
  # @ciphered_str = ""
  UPPER_CASE_ASCII_MIN = 65
  UPPER_CASE_ASCII_MAX = 90
  LOWER_CASE_ASCII_MIN = 97
  LOWER_CASE_ASCII_MAX = 122

  def initialize
    @@ciphered_str = ''
  end

  def ciphering(str, shift_index)
    str = str.split(' ')
    puts str

    (0...str.length).each do |word_index|
      # Shifting letter index
      (0...str[word_index].length).each do |letter_index|
        # Getting character's ASCII --> .ord
        # Shift then .chr to convert back
        # puts str[word_index][letter_index]
        @current_letter = str[word_index][letter_index].ord
        puts @current_letter
        if @current_letter >= UPPER_CASE_ASCII_MIN && @current_letter <= UPPER_CASE_ASCII_MAX
          puts 'Here1'
          puts @current_letter
          if (@current_letter + shift_index) / UPPER_CASE_ASCII_MAX >= 1
            # Wrapping around
            @current_letter = (@current_letter + shift_index) % UPPER_CASE_ASCII_MAX + UPPER_CASE_ASCII_MIN - 1
          else
            @current_letter = (@current_letter + shift_index) % UPPER_CASE_ASCII_MAX
          end
        elsif @current_letter >= LOWER_CASE_ASCII_MIN && @current_letter <= LOWER_CASE_ASCII_MAX
          puts 'Here2'
          puts @current_letter
          if (@current_letter + shift_index) / LOWER_CASE_ASCII_MAX >= 1
            # Wrapping around
            @current_letter = (@current_letter + shift_index) % LOWER_CASE_ASCII_MAX + LOWER_CASE_ASCII_MAX
          else
            @current_letter = (@current_letter + shift_index) % LOWER_CASE_ASCII_MAX
          end
        end
        @@ciphered_str += @current_letter.chr
      end
      @@ciphered_str << ' ' if word_index < str.length
    end
    puts @@ciphered_str
    clear
  end

  def clear
    @@ciphered_str = ''
  end
end

test1 = CaesarCipher.new
test1.ciphering('What a string!', 5)
