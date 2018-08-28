# frozen_string_literal: true

require 'openssl'

# An extension to turn a string representing a private key into a .pem file
class String
  def to_pem
    pem_key = scan(/.{1,64}/).tap do |lines|
      lines.unshift '-----BEGIN EC PRIVATE KEY-----'
      lines.push '-----END EC PRIVATE KEY-----'
    end.join("\n")
    OpenSSL::PKey::EC.new pem_key
  end
end
