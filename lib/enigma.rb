require "./generateable"

class Enigma
include Generateable

  def initialize

  end

  def encrypt(message, key = random_key, date = Date.today.strftime("%d%m%y"))
    message
  end

  def decrypt(ciphertext, key, date = Date.today.strftime("%d%m%y"))
    ciphertext
  end
end
