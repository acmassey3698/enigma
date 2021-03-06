require "./lib/generateable"

class DecryptAlgorithm
include Generateable
  attr_reader :ciphertext,
              :key,
              :date

  def initialize(ciphertext, key, date)
    @ciphertext = ciphertext
    @key = key
    @date = date
  end

  def create_message
    message_characters(@ciphertext).map.with_index do |character, index|
      decrypt_character(character, index, final_shifts(@key, @date))
    end.join
  end

  def decrypt_character(character, index, final_shifts)
    if characters_array.include?(character)
      rotated = characters_array.rotate((final_shifts.values[index % 4]) * -1)
      rotated[characters_array.index(character)]
    else
      character
    end
  end
end
