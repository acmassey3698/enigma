require "date"

module Generateable

  def random_key
    key = []
    5.times do
      key << rand(9).to_s
    end
    key.join
  end

  def todays_date
    Date.today.strftime("%d%m%y")
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
    {:a =>(split_keys(key)[0].to_i + offsets(date)[0].to_i),
     :b =>(split_keys(key)[1].to_i + offsets(date)[1].to_i),
     :c =>(split_keys(key)[2].to_i + offsets(date)[2].to_i),
     :d =>(split_keys(key)[3].to_i + offsets(date)[3].to_i)}
  end

  def characters_array
    ("a".."z").to_a << " "
  end

  def message_characters(message)
    message.downcase.split("")
  end
end
