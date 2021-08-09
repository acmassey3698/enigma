require "simplecov"
SimpleCov.start
require "./lib/generateable"
require "./lib/decrypt_algorithim"

RSpec.describe DecryptAlgorithim do

  it "exists with attributes" do
    algo = DecryptAlgorithim.new("keder ohulw", "02715", "040895")

    expect(algo).to be_a(DecryptAlgorithim)
    expect(algo.ciphertext).to eq("keder ohulw")
    expect(algo.key).to eq("02715")
    expect(algo.date).to eq("040895")
  end

  it "creates a message" do
    algo = DecryptAlgorithim.new("keder ohulw", "02715", "040895")
    algo_2 = DecryptAlgorithim.new("taqyhpvkhqublz", "05361", "080522")

    expect(algo.create_message).to eq("hello world")
    expect(algo_2.create_message).to eq("my name andrew")
  end

  it "decrypts a character" do
    algo = DecryptAlgorithim.new("keder ohulw", "02715", "040895")
    algo_2 = DecryptAlgorithim.new("taqyhpvkhqublz", "05361", "080522")

    expect(algo.decrypt_character("k", 0, [3, 27, 73, 20])).to eq("h")
    expect(algo_2.decrypt_character("a", 1, [7, 57, 44, 65])).to eq("y")
  end

  it "recognizes punctuation marks and does not try to decrypt them" do
    algo = DecryptAlgorithim.new("keder, ohulw", "02715", "040895")

    expect(algo.decrypt_character(",", 5, [3, 27, 73, 20])).to eq(",")
  end
end
