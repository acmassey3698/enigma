# require "simplecov"
# SimpleCov.start
# require "./lib/key"
#
# RSpec.describe Key do
#
#   it "exists" do
#     key_1 = Key.new
#
#     expect(key_1).to be_a(Key)
#   end
#
#   it "generates a random key" do
#     key_1 = Key.new
#
#     key_1.generate_key
#
#     expect(key_1.full_key).to be_a(String)
#   end
#
#   it "splits a key" do
#     key_1 = Key.new
#
#     key_1.generate_key
#     key_1.split_key
#
#     expect(key_1.split_key).to be_a(Array)
#   end
