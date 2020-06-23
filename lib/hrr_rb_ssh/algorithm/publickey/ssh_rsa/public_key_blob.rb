# coding: utf-8
# vim: et ts=2 sw=2

require 'hrr_rb_ssh/codable'

module HrrRbSsh
  module Algorithm
    class Publickey
      class SshRsa
        class PublicKeyBlob
          include Codable
          DEFINITION = [
            [DataTypes::String, :'public key algorithm name'],
            [DataTypes::Mpint,  :'e'],
            [DataTypes::Mpint,  :'n'],
          ]
        end
      end
    end
  end
end
