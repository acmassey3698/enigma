require "./generateable"
require "date"

class Enigma
include Generateable

  def initialize

  end

  def encrypt(message, key = random_key, date = Date.today.strftime("%d%m%y"))
    # shifts = final_shifts(key, date)
    # split_message = message.split("")
    # characters = characters_array

    encrypted = EncryptAlgorithim.new(message, key, date)
    require "pry"; binding.pry
  end

  def decrypt(ciphertext, key, date = Date.today.strftime("%d%m%y"))
    ciphertext
    #Returns a hash with these three keys
    ## :decryption => the decrypted String
    ## :key => the key used for decryption as a String
    ## :date => the date used for decryption as a String in the form DDMMYY
  end
end
