class EncryptAlgorithim
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
    encrypted_message =
    message_characters(@message).map.with_index do |character, index|
      encode(character, index, final_shifts(@key, @date))
    end
    encrypted_message.join
  end

end
