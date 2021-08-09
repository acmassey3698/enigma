require './lib/enigma'
require './lib/encrypt_algorithim'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new
output = enigma.encrypt(incoming_text)

puts "Created 'encrypted.txt' with the key #{output[:key]} and the date #{output[:date]}"

writer = File.open(ARGV[1], "w")
writer.write(output[:encryption])
writer.close
