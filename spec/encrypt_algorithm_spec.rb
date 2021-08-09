require "./spec_helper"
require "./lib/generateable"
require "./lib/encrypt_algorithm"

RSpec.describe EncryptAlgorithm do

  it "exists with attributes" do
    algo = EncryptAlgorithm.new("Hello World", "02715", "040895")

    expect(algo).to be_an(EncryptAlgorithm)
    expect(algo.message).to eq("Hello World")
    expect(algo.key).to eq("02715")
    expect(algo.date).to eq("040895")
  end

  it "creates a message" do
    algo   = EncryptAlgorithm.new("Hello World", "02715", "040895")
    algo_2 = EncryptAlgorithm.new("My Name Andrew", "05361", "080522")

    expect(algo.create_message).to eq("keder ohulw")
    expect(algo_2.create_message).to eq("taqyhpvkhqublz")
  end

  it "encrypts each character" do
    algo   = EncryptAlgorithm.new("Hello World", "02715", "040895")
    algo_2 = EncryptAlgorithm.new("My Name Andrew", "05361", "080522")

    expect(algo.encrypt_character("h", 0, {a: 3, b: 27, c: 73, d: 20})).to eq("k")
    expect(algo_2.encrypt_character("y", 1, {a: 7, b: 57, c: 44, d: 65})).to eq("a")
  end

  it "recognizes punctuation marks and does not try to encrypt them" do
    algo   = EncryptAlgorithm.new("Hello, World", "02715", "040895")

    expect(algo.encrypt_character(",", 5, {a: 3, b: 27, c: 73, d: 20})).to eq(",")
  end
end
