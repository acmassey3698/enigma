require "./key"

class Enigma
include Generateable

  def initialize

  end

  def encrypt(message, key = generate_key, date = today)
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

  def today(date = Time.now)
    date.strftime("%d%m%y")
  end


end
