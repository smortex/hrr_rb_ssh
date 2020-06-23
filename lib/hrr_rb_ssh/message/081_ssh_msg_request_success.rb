# coding: utf-8
# vim: et ts=2 sw=2

require 'hrr_rb_ssh/codable'

module HrrRbSsh
  module Message
    class SSH_MSG_REQUEST_SUCCESS
      include Codable

      ID    = self.name.split('::').last
      VALUE = 81

      DEFINITION = [
        #[DataTypes, Field Name]
        [DataTypes::Byte,      :'message number'],
      ]

      TCPIP_FORWARD_DEFINITION = [
        #[DataTypes, Field Name]
        #[DataTypes::String,   :'request name' : "tcpip-forward"],
        [DataTypes::Uint32,    :'port that was bound on the server'],
      ]

      CONDITIONAL_DEFINITION = {
        # Field Name => {Field Value => Conditional Definition}
        :'request name' => {
          "tcpip-forward" => TCPIP_FORWARD_DEFINITION,
        }
      }
    end
  end
end
