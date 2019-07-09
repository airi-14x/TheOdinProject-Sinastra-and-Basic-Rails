class CaesarCipher
  # Upper case - ASCII: 65 -> 90
  # Lower case - ASCII: 97 -> 122
  ciphered_str = ""
  UPPER_CASE_ASCII_MIN = 65
  UPPER_CASE_ASCII_MAX = 90
  LOWER_CASE_ASCII_MIN = 97
  LOWER_CASE_ASCII_MAX = 122
  def ciphering(str, shift_index)
    str = str.split(" ")
    #puts str

    for word_index in 0...str.length do
        # Shifting letter index
        for letter_index in 0...str[word_index].length do
          # Getting character's ASCII --> .ord
          # Shift then .chr to convert back
          #puts str[word_index][letter_index]
          current_letter = str[word_index][letter_index].ord

          if current_letter >= UPPER_CASE_ASCII_MIN && current_letter <= UPPER_CASE_ASCII_MAX
            if (current_letter + shift_index) / UPPER_CASE_ASCII_MAX >= 1
              # Loop over
              current_letter = (current_letter + shift_index) % UPPER_CASE_ASCII_MAX + UPPER_CASE_ASCII_MIN-1
          end
        end
    end
  end
end
