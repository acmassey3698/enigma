# ENIGMA

"Enigma" is the final solo project in Mod 1 of the Turing School of Software and
 Design's Backend Engineering Program

In Enigma, I used Ruby to build an encryption algorithm. The algorithm works in
both the encrypt, and decrypt direction

Users can encrypt a message by adding it to the `message.txt` file and
and then running the following line of code from project's directory in their
terminal

**ENCRYPT**

`ruby ./lib/encrypt.rb message.txt encrypted.txt`

Users can then decrypt the newly encrypted file by running the following line of
code from the project's directory in their terminal.

*When you run the decrypt command, be sure to replace "key" and "date" with the*
*key and date values from the encryption's output*

**DECRYPT**

`ruby ./lib/decrypt.rb encrypted.txt decrypted.txt key date`

## STUDENT SELF-EVALUATION

**FUNCTIONALITY**

- Meets Expectations
- The Enigma class works appropriately and only includes the encrypt and decrypt
  methods. The CLI takes the appropriate number of arguments and achieves the
  desired functionality

**OBJECT ORIENTED PROGRAMMING**

- Above Expectations
- The generateable module is included in the three classes where it's
  functionality is needed and would otherwise be repeated. Inheritance could be
  used in the algorithm classes, but it does not seem necessary as there would
  only be one method in the parent class.

**RUBY CONVENTIONS AND MECHANICS**

- Above Expectations
- All elements of the project adhere to ruby convention. All appropriate data
  types were utilized and enumerables were used to achieve more streamlined code.

**TEST DRIVEN DEVELOPMENT**

- Above Expectations
- Stubs were utilized to test methods that relied on random or time-sensitive
  input. All methods were individually tested. Each method in the generateable
  module was tested for every class that it is included. Test coverage is at
  211 / 211 (100.0%)

**VERSION CONTROL**

- Frequent commits were completed throughout the projects and branches were used
  to create functionality in logical pieces.
