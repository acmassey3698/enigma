require "./lib/generateable"
require "./lib/encrypt_algorithm"
require "./lib/decrypt_algorithm"

class Enigma
include Generateable

  def encrypt(message, key = random_key, date = todays_date)
    if key.length == 6
      date = key
      key = random_key
    end
    algorithm = EncryptAlgorithm.new(message, key, date)
    output = {
      :encryption => algorithm.create_message,
      :key        => key,
      :date       => date
    }
  end

  def decrypt(ciphertext, key, date = todays_date)
    algorithm = DecryptAlgorithm.new(ciphertext, key, date)
    output = {
      :encryption => algorithm.create_message,
      :key        => key,
      :date       => date
    }
  end
end
