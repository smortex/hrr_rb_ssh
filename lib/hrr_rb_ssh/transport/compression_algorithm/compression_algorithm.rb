# coding: utf-8
# vim: et ts=2 sw=2

require 'hrr_rb_ssh/logger'

module HrrRbSsh
  class Transport
    class CompressionAlgorithm
      class CompressionAlgorithm
        @@list = Array.new

        def self.inherited klass
          @@list.push klass
        end

        def self.list
          @@list
        end

        def self.name_list
          @@list.map{ |klass| klass::NAME }
        end

        def self.[] key
          @@list.find{ |klass| key == klass::NAME }
        end

        def initialize direction
          @logger = HrrRbSsh::Logger.new self.class.name
        end
      end
    end
  end
end
