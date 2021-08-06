module Generateable

  def random_key
    key = rand(99999).to_s
    if key.length < 5
      key.prepend("0") until key.length == 5
    end
  end

  def split_keys(key)
    [key[0..1], key[1..2], key[2..3], key[3..4]]
  end

  def offsets(date)
    squared = date.to_i * date.to_i
    last_four = squared.to_s[-4..-1]
    last_four.split("")
  end

  def final_shifts(key, date)
    final_shifts = {
    a: split_keys(key)[0].to_i + offsets(date)[0].to_i,
    b: split_keys(key)[1].to_i + offsets(date)[1].to_i,
    c: split_keys(key)[2].to_i + offsets(date)[2].to_i,
    d: split_keys(key)[3].to_i + offsets(date)[3].to_i,
  }
  end

  def characters_array
    ("a".."z").to_a << " "
  end

end
