require "./generateable"
require "date"
require "./encrypt_algorithim"
require "./decrypt_algorithim"

class Enigma
include Generateable

  def encrypt(message, key = random_key, date = Date.today.strftime("%d%m%y"))
    if key.length == 6
      date = key
      key = random_key
    end

    algorithim = EncryptAlgorithim.new(message, key, date)
    output = {
      :encryption => algorithim.create_message,
      :key        => key,
      :date       => date
    }
  end

  def decrypt(ciphertext, key, date = Date.today.strftime("%d%m%y"))
    algorithim = DecryptAlgorithim.new(ciphertext, key, date)
    output = {
      :encryption => algorithim.create_message,
      :key        => key,
      :date       => date
    }
  end
end
