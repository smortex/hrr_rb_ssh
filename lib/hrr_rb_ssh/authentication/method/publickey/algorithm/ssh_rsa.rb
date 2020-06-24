require 'hrr_rb_ssh/authentication/method/publickey/algorithm/functionable'

module HrrRbSsh
  class Authentication
    class Method
      class Publickey
        class Algorithm
          class SshRsa < Algorithm
            NAME = 'ssh-rsa'
            PREFERENCE = 20
            DIGEST = 'sha1'

            include Functionable
          end
        end
      end
    end
  end
end
