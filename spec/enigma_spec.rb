require "simplecov"
SimpleCov.start
require './lib/enigma'

RSpec.describe Enigma do
  it "exists" do
    enigma = Enigma.new

    expect(enigma).to be_an(Enigma)
  end

  it "has an encrypt method that can take all three arguments" do
    enigma = Enigma.new

    input = enigma.encrypt("Hello World", "31233", "210707")

    expect(input).to be_a(String)
  end

  it "it has an encrypt method that can take only two arguments" do
    enigma = Enigma.new

    input_without_date = enigma.encrypt("Hello World", "31233",)
    input_without_key = enigma.encrypt("Hello World", "210707")

    expect(input_without_date).to be_a(String)
    expect(input_without_key).to be_a(String)
  end

  it "has an encrypt method that can take just the message" do
    enigma = Enigma.new

    input_only_message = enigma.encrypt("Hello World")

    expect(input_only_message).to be_a(String)
  end



end
