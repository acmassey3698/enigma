class Key
  attr_reader :key,
              :offsets

  def initialize
    @key = nil
    @offsets = []
  end

  def generate_key
    key = rand(99999).to_s

    if key.length < 5
      key.prepend("0") until key.length == 5
    end
    @key = key
  end

  def split_key
    [@key[0..1], @key[1..2], @key[2..3], @key[3..4]]
  end





end
