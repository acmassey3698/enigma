require "./spec_helper"
require "./lib/generateable"
require "./lib/decrypt_algorithm"

RSpec.describe DecryptAlgorithm do

  it "exists with attributes" do
    algo = DecryptAlgorithm.new("keder ohulw", "02715", "040895")

    expect(algo).to be_a(DecryptAlgorithm)
    expect(algo.ciphertext).to eq("keder ohulw")
    expect(algo.key).to eq("02715")
    expect(algo.date).to eq("040895")
  end

  it "creates a message" do
    algo = DecryptAlgorithm.new("keder ohulw", "02715", "040895")
    algo_2 = DecryptAlgorithm.new("taqyhpvkhqublz", "05361", "080522")

    expect(algo.create_message).to eq("hello world")
    expect(algo_2.create_message).to eq("my name andrew")
  end

  it "decrypts a character" do
    algo = DecryptAlgorithm.new("keder ohulw", "02715", "040895")
    algo_2 = DecryptAlgorithm.new("taqyhpvkhqublz", "05361", "080522")

    expect(algo.decrypt_character("k", 0, {a: 3, b: 27, c: 73, d: 20})).to eq("h")
    expect(algo_2.decrypt_character("a", 1, {a: 7, b: 57, c: 44, d: 65})).to eq("y")
  end

  it "recognizes punctuation marks and does not try to decrypt them" do
    algo = DecryptAlgorithm.new("keder, ohulw", "02715", "040895")

    expect(algo.decrypt_character(",", 5, {a: 3, b: 27, c: 73, d: 20})).to eq(",")
  end
end
