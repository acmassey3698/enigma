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

  it "completes a rotation" do
    algo = EncryptAlgorithim.new("Hello World", "02715", "040895")

    expect(algo.create_message).to eq("keder ohulw")
  end



end
