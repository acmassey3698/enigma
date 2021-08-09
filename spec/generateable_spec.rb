require "./spec_helper"
require "./lib/generateable"
require "./lib/enigma"
require "./lib/encrypt_algorithim"
require "./lib/decrypt_algorithim"

RSpec.describe Generateable do

  before :each do
    @enigma = Enigma.new
    @encrypt_algo = EncryptAlgorithim.new("Hello World", "02715", "040895")
    @decrypt_algo = DecryptAlgorithim.new("keder ohulw", "02715", "040895")
  end

  context "Tests for the enigma class" do

    it "generates a random key for the enigma class" do
      expect(@enigma.random_key).to be_a(String)
      allow(@enigma).to receive(:random_key).and_return("08269")
      expect(@enigma.random_key).to eq("08269")
    end

    it "returns today's date for the enigma class" do
      expect(@enigma.todays_date).to be_a(String)
      allow(@enigma).to receive(:todays_date).and_return("080821")
      expect(@enigma.todays_date).to eq("080821")
    end

    it "splits a key" do
      expected = ["12", "23", "34", "45"]
      expect(@enigma.split_keys("12345")).to eq(expected)
    end

    it "calculates the offset" do
      expected = ["2", "4", "8", "4"]
      expect(@enigma.offsets("080522")).to eq(expected)
    end

    it "calculates the final shifts" do
      expected =
       {
      :a => 7,
      :b => 57,
      :c => 44,
      :d => 65
      }
      expect(@enigma.final_shifts("05361", "080522")).to eq(expected)
    end

    it "generates an array of characters" do
      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(@enigma.characters_array).to eq(expected)
    end

    it "splits a message into its individual characters" do
      expected = ["h", "e", "l", "l", "o"]
      expect(@enigma.message_characters("hello")).to eq(expected)
    end
  end

  context "tests for the encrypt algo" do
    it "recieves a random key" do
      expect(@encrypt_algo.random_key).to be_a(String)
      allow(@encrypt_algo).to receive(:random_key).and_return("02154")
      expect(@encrypt_algo.random_key).to eq("02154")
    end

    it "generates todays date" do
      expect(@encrypt_algo.todays_date).to be_a(String)
      allow(@encrypt_algo).to receive(:todays_date).and_return("080821")
      expect(@encrypt_algo.todays_date).to eq("080821")
    end

    it "splits the key" do
      expect(@encrypt_algo.split_keys(@encrypt_algo.key)).to eq(["02", "27", "71", "15"])
    end

    it "creates the offsets" do
      expect(@encrypt_algo.offsets(@encrypt_algo.date)).to eq(["1", "0", "2", "5"])
    end

    it "creates the final shifts" do
      expected =
      {
     :a => 3,
     :b => 27,
     :c => 73,
     :d => 20
     }
      expect(@encrypt_algo.final_shifts(@encrypt_algo.key, @encrypt_algo.date)).to eq(expected)
    end

    it "creates an array of characters" do
      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(@encrypt_algo.characters_array).to eq(expected)
    end

    it "splits the message into an array of characters" do
      expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
      expect(@encrypt_algo.message_characters(@encrypt_algo.message)).to eq(expected)
    end
  end

  context "tests for the decrypt DecryptAlgorithim class" do
    it "recieves a random key" do
      expect(@decrypt_algo.random_key).to be_a(String)
      allow(@decrypt_algo).to receive(:random_key).and_return("02154")
      expect(@decrypt_algo.random_key).to eq("02154")
    end

    it "generates todays date" do
      expect(@decrypt_algo.todays_date).to be_a(String)
      allow(@decrypt_algo).to receive(:todays_date).and_return("080821")
      expect(@decrypt_algo.todays_date).to eq("080821")
    end

    it "splits the key" do
      expect(@decrypt_algo.split_keys(@decrypt_algo.key)).to eq(["02", "27", "71", "15"])
    end

    it "creates the offsets" do
      expect(@decrypt_algo.offsets(@decrypt_algo.date)).to eq(["1", "0", "2", "5"])
    end

    it "creates the final shifts" do
      expected =
      {
     :a => 3,
     :b => 27,
     :c => 73,
     :d => 20
     }
      expect(@decrypt_algo.final_shifts(@decrypt_algo.key, @decrypt_algo.date)).to eq(expected)
    end

    it "creates an array of characters" do
      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(@decrypt_algo.characters_array).to eq(expected)
    end

    it "splits the message into an array of characters" do
      "keder ohulw"
      expected = ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"]
      expect(@decrypt_algo.message_characters(@decrypt_algo.ciphertext)).to eq(expected)
    end
  end
end
