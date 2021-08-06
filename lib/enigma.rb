require "./generateable"

class Enigma
include Generateable

  def initialize

  end

  def encrypt(message, key = generate_key, date = Date.today.strftime("%d%m%y"))
    message
    generate_offsets(date)
  end

  def decrypt(ciphertext, key, date = Date.today.strftime("%d%m%y"))
    ciphertext
  end
end
