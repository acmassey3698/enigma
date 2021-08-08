require "simplecov"
SimpleCov.start
require "./lib/generateable"
require "./lib/enigma"
require "./lib/encrypt_algorithim"

RSpec.describe EncryptAlgorithim do

  it "exists with attributes" do
    algo = EncryptAlgorithim.new("Hello World", "02715", "040895")

    expect(algo).to be_an(EncryptAlgorithim)
    expect(algo.message).to eq("Hello World")
    expect(algo.key).to eq("02715")
    expect(algo.date).to eq("040895")
  end

  it "creates a message" do
    algo   = EncryptAlgorithim.new("Hello World", "02715", "040895")
    algo_2 = EncryptAlgorithim.new("My Name Andrew", "05361", "080522")

    expect(algo.create_message).to eq("keder ohulw")
    expect(algo_2.create_message).to eq("taqyhpvkhqublz")
  end

  it "encrypts each character" do
    algo   = EncryptAlgorithim.new("Hello World", "02715", "040895")
    algo_2 = EncryptAlgorithim.new("My Name Andrew", "05361", "080522")

    expect(algo.encrypt_character("h", 0, [3, 27, 73, 20])).to eq("k")
    expect(algo_2.encrypt_character("y", 1, [7, 57, 44, 65])).to eq("a")
  end
end
