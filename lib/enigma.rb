require "./generateable"

class Enigma
include Generateable

  def initialize

  end

  def encrypt(message, key = generate_key, date = Date.today.strftime("%d%m%y"))
    message
  end

  # def random_key
  #   key = rand(99999).to_s
  #
  #   if key.length < 5
  #     key.prepend("0") until key.length == 5
  #     end
  #   key
  # end



end
