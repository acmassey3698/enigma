module Generateable

  def generate_key
    key = rand(99999).to_s

    if key.length < 5
      key.prepend("0") until key.length == 5
    end
  end

  def split_key(key)
    [key[0..1], key[1..2], key[2..3], key[3..4]]
  end

  def generate_offsets(date)
    squared = date.to_i * date.to_i
    last_four = squared.to_s[-4..-1]
    last_four.split("")
    require "pry"; binding.pry
  end

  def generate_final_shifts(date)

  end

  # def offset_a(key)
  #   split_key(key)[0]
  # end
  #
  # def offset_b
  #   split_key(key)[1]
  # end
  #
  # def offset_c
  #   split_key(key)[2]
  # end
  #
  # def offset_d
  #   split_key(key)[3]
  # end
end
