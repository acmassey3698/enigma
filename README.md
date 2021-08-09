## ENIGMA

"Enigma" is the final solo project in Mod 1 of the Turing School of Software and
 Design's Backend Engineering Program

In Enigma, I used Ruby to build an encryption algorithm. The algorithm works in
both the encrypt, and decrypt direction

Users can encrypt a message by adding it to the `message.txt` file and
and then running the following line of code from project's directory in their
terminal

# ENCRYPT
`ruby ./lib/encrypt.rb message.txt encrypted.txt`

Users can then decrypt the newly encrypted file by running the following line of
code from the project's directory in their terminal.

* When you run the decrypt command, be sure to replace "key" and "date" with the
key and date values from the encryption's output. *

# DECRYPT
`ruby ./lib/decrypt.rb encrypted.txt decrypted.txt key date`
