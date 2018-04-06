# coding: utf-8
# vim: et ts=2 sw=2

module HrrRbSsh
  class Transport
    class EncryptionAlgorithm
      def self.list
        EncryptionAlgorithm.list
      end

      def self.name_list
        EncryptionAlgorithm.name_list
      end

      def self.[] key
        EncryptionAlgorithm[key]
      end
    end
  end
end

require 'hrr_rb_ssh/transport/encryption_algorithm/encryption_algorithm'
require 'hrr_rb_ssh/transport/encryption_algorithm/none'
require 'hrr_rb_ssh/transport/encryption_algorithm/three_des_cbc'
require 'hrr_rb_ssh/transport/encryption_algorithm/blowfish_cbc'
require 'hrr_rb_ssh/transport/encryption_algorithm/aes128_cbc'
require 'hrr_rb_ssh/transport/encryption_algorithm/aes192_cbc'
require 'hrr_rb_ssh/transport/encryption_algorithm/aes256_cbc'
require 'hrr_rb_ssh/transport/encryption_algorithm/aes128_ctr'
require 'hrr_rb_ssh/transport/encryption_algorithm/aes192_ctr'
require 'hrr_rb_ssh/transport/encryption_algorithm/aes256_ctr'
