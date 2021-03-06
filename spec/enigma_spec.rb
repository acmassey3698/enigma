require "./spec_helper"
require './lib/enigma'
require "date"

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

    allow(enigma).to receive(:random_key).and_return("08269")
    allow(enigma).to receive(:todays_date).and_return("080821")

    input_without_date = enigma.encrypt("Hello World", "02715")
    input_without_key = enigma.encrypt("Hello World", "080821")

    expected_1 = {
      :date => "080821",
      :encryption => "nefau qdxly",
      :key => "02715"
    }

    expected_2 = {
      :date=>"080821",
      :encryption=>"tfoa azdcmg",
      :key=>"08269"
    }

    expect(input_without_date).to eq(expected_1)
    expect(input_without_key).to eq(expected_2)
  end

  it "has an encrypt method that can take just the message" do
    enigma = Enigma.new

    allow(enigma).to receive(:random_key).and_return("08269")
    allow(enigma).to receive(:todays_date).and_return("080821")

    input_only_message = enigma.encrypt("Hello World")

    expected = {
      :date => "080821",
      :encryption => "tfoa azdcmg",
      :key => "08269",
    }

    expect(input_only_message).to eq(expected)
  end

  it "has a decrypt method that can take all three arguments" do
    enigma = Enigma.new

    input = enigma.decrypt("tfoa azdcmg", "08269", "080821")

    expected ={
      :date => "080821",
      :encryption => "hello world",
      :key => "08269",
    }

    expect(input).to eq(expected)
  end

  it "has a decrypt method that allows for an omitted date" do
    enigma = Enigma.new

    allow(enigma).to receive(:todays_date).and_return("080821")

    input_without_date = enigma.decrypt("tfoa azdcmg", "08269")

    expected = {
      :date => "080821",
      :encryption => "hello world",
      :key => "08269",
    }

    expect(input_without_date).to eq(expected)
  end
end
