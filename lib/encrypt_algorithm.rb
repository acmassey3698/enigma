require "./lib/generateable"

class EncryptAlgorithm
include Generateable
  attr_reader :message,
              :key,
              :date

  def initialize(message, key, date)
    @message = message
    @key     = key
    @date    = date
  end

  def create_message
    message_characters(@message).map.with_index do |character, index|
      encrypt_character(character, index, final_shifts(@key, @date))
    end.join
  end

  def encrypt_character(character, index, final_shifts)
    if characters_array.include?(character)
      rotated = characters_array.rotate(final_shifts.values[index % 4])
      rotated[characters_array.index(character)]
    else
      character
    end
  end
end
