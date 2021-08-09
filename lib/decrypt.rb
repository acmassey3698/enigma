require './lib/enigma'
require './lib/encrypt_algorithim'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

key = ARGV[2]
date = ARGV[3]

enigma = Enigma.new
output = enigma.decrypt(incoming_text, key, date)

writer = File.open(ARGV[1], "w")
writer.write(output[:encryption])
writer.close

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
