require './lib/enigma'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new
output = enigma.encrypt(incoming_text)

writer = File.open(ARGV[1], "w")
writer.write(output[:encryption])
writer.close

puts "Created 'encrypted.txt' with the key #{output[:key]} and the date #{output[:date]}"
