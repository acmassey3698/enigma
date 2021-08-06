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





end
