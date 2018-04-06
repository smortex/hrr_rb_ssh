# coding: utf-8
# vim: et ts=2 sw=2

require 'hrr_rb_ssh/transport/encryption_algorithm/encryption_algorithm'
require 'hrr_rb_ssh/transport/encryption_algorithm/functionable'

module HrrRbSsh
  class Transport
    class EncryptionAlgorithm
      class Aes128Cbc < EncryptionAlgorithm
        NAME        = 'aes128-cbc'
        CIPHER_NAME = "AES-128-CBC"

        include Functionable
      end
    end
  end
end
