require "veronica/version"

module Veronica
  VALID_SHA2_BIT_LENGTHS = [256, 384, 512]
  VALID_SHA2_ENCODING_FORMATS = ["hexdigest", "base64digest", "digest"]

  # We use hexdigest by default for familiarities sake
  def self.generate_sha2(digest_bits: , string: , encoding_format: "hexdigest")
    unless VALID_SHA2_BIT_LENGTHS.include?(digest_bits)
      raise ArgumentError, "You can only use 256, 384, or 512 for bit length."
    end

    unless VALID_SHA2_ENCODING_FORMATS.include?(encoding_format)
      raise ArgumentError, "You can only use hexdigest, base64digest or just digest for an encoding format."
    end

    Digest::SHA2.new(digest_bits).method(encoding_format.to_sym).(string)
  end
end
