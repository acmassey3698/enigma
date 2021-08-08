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

    input = enigma.encrypt("Hello World", "02715", "040895")

    expected_output =
    {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
    }

    expect(input).to eq(expected_output)
  end

  it "it has an encrypt method that can take only two arguments" do
    enigma = Enigma.new

    input_without_date = enigma.encrypt("Hello World", "02715")
    input_without_key = enigma.encrypt("Hello World", "210707")

    expected_1 = {
      :date => "080821",
      :encryption => "nefau qdxly",
      :key => "02715"
    }

    expect(input_without_date).to eq(expected_1)
    expect(input_without_key).to eq(expected_1)
  end

  it "has an encrypt method that can take just the message" do
    enigma = Enigma.new

    input_only_message = enigma.encrypt("Hello World")

    expected = {
      :date => "080821",
      :encryption => "rwrwyrbzacj",
      :key => "87291",
    }

    expect(input_only_message).to eq(expected)
  end

  xit "has a decrypt method that can take all three arguments" do
    enigma = Enigma.new

    input = enigma.decrypt("acdn nfaone", "23542", "120385")

    expect(input).to be_a(String)
  end

  xit "has a decrypt method that allows for an omitted date" do
    enigma = Enigma.new

    input_without_date = enigma.decrypt("dasfn fdas", "34324")

    expect(input_without_date).to be_a(String)
  end
end
