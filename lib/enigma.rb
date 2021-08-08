require "./generateable"
require "date"

class Enigma
include Generateable

  def initialize

  end

  def encrypt(message, key = random_key, date = Date.today.strftime("%d%m%y"))
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
