require 'spec_helper'

RSpec.describe Veronica do  
  it "has a version number" do
    expect(Veronica::VERSION).not_to be nil
  end
  
  it "is a module" do
    expect(Veronica).to be_a(Module)
  end
  
  it "raises if passed an invalid bit length for sha2" do
    expect {
      Veronica.basic_sha2_string(digest_bits: 13, string: "oh no")
    }.to raise_error(/You can only use 256, 384, or 512 for bit length/)
  end

  it "raises if passed an invalid encoding format for sha2" do
    expect {
      Veronica.basic_sha2_string(digest_bits: 256, string: "oh no", encoding_format: "pretty flowers")
    }.to raise_error(/You can only use hexdigest, base64digest or just digest for an encoding format/)
  end
  
  it "hashes a string with sha2 256" do
    string = Faker::TheThickOfIt.character
    hash = Veronica.basic_sha2_string(digest_bits: 256, string: string)
    analysis = Zxcvbn.test(hash, [string])

    expect(hash).to_not eq(string)
    expect(analysis.crack_time_display).to eq("centuries")
  end

  it "hashes a string with sha2 384" do
    string = Faker::TheThickOfIt.character
    hash = Veronica.basic_sha2_string(digest_bits: 384, string: string)
    analysis = Zxcvbn.test(hash, [string])

    expect(hash).to_not eq(string)
    expect(analysis.crack_time_display).to eq("centuries")
  end

  it "hashes a string with sha2 512" do
    string = Faker::TheThickOfIt.character
    hash = Veronica.basic_sha2_string(digest_bits: 512, string: string)
    analysis = Zxcvbn.test(hash, [string])
    
    expect(hash).to_not eq(string)
    expect(analysis.crack_time_display).to eq("centuries")
  end

  it "hashes a string with sha2 base64digest" do
    string = Faker::TheThickOfIt.character
    hash = Veronica.basic_sha2_string(digest_bits: 512, string: string, encoding_format: "base64digest")
    analysis = Zxcvbn.test(hash, [string])

    expect(hash).to_not eq(string)
    expect(analysis.crack_time_display).to eq("centuries")
  end

  it "hashes a string with sha2 digest" do
    string = Faker::TheThickOfIt.character
    hash = Veronica.basic_sha2_string(digest_bits: 512, string: string, encoding_format: "digest")
    analysis = Zxcvbn.test(hash, [string])
    
    expect(hash).to_not eq(string)
    expect(analysis.crack_time_display).to eq("centuries")
  end

  it "hashes a string the same way twice" do
    string = Faker::TheThickOfIt.character
    hash = Veronica.basic_sha2_string(digest_bits: 512, string: string)
    
    expect(hash).to_not eq(string)
    
    hash_again = Veronica.basic_sha2_string(digest_bits: 512, string: string)
    expect(hash).to eq(hash_again)
  end

  it "hashes a string using openssl digest" do
    string = Faker::TheThickOfIt.character
    hash = Veronica.openssl_sha2_string(digest_bits: "SHA512", string: string)
    
    expect(hash).to_not eq(string)
    
    hash_again = Veronica.openssl_sha2_string(digest_bits: "SHA512", string: string)
    expect(hash).to eq(hash_again)
  end
end