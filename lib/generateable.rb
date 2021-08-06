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
  end

  def generate_final_shifts(key, date)
    a = split_key(key)[0].to_i +  generate_offsets(date)[0].to_i
    b = split_key(key)[1].to_i +  generate_offsets(date)[1].to_i
    c = split_key(key)[2].to_i +  generate_offsets(date)[2].to_i
    d = split_key(key)[3].to_i +  generate_offsets(date)[3].to_i
    final_shifts = [ a, b, c, d]
  end

end
