# coding: utf-8
# vim: et ts=2 sw=2

require 'hrr_rb_ssh/logger'

module HrrRbSsh
  module Message
    class SSH_MSG_KEXINIT
      ID    ||= self.name.split('::').last
      VALUE ||= 20

      def self.definition
        [
          # [Data Type, Field Name]
          ['byte',      'SSH_MSG_KEXINIT'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['byte',      'cookie (random byte)'],
          ['name-list', 'kex_algorithms'],
          ['name-list', 'server_host_key_algorithms'],
          ['name-list', 'encryption_algorithms_client_to_server'],
          ['name-list', 'encryption_algorithms_server_to_client'],
          ['name-list', 'mac_algorithms_client_to_server'],
          ['name-list', 'mac_algorithms_server_to_client'],
          ['name-list', 'compression_algorithms_client_to_server'],
          ['name-list', 'compression_algorithms_server_to_client'],
          ['name-list', 'languages_client_to_server'],
          ['name-list', 'languages_server_to_client'],
          ['boolean',   'first_kex_packet_follows'],
          ['uint32',    '0 (reserved for future extension)'],
        ]
      end
    end
  end
end
