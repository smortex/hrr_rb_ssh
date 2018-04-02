# coding: utf-8
# vim: et ts=2 sw=2

require 'logger'
require 'pty'
require 'socket'

begin
  require 'hrr_rb_ssh'
rescue LoadError
  $:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
  require 'hrr_rb_ssh'
end


logger = Logger.new STDOUT
logger.level = Logger::INFO
HrrRbSsh::Logger.initialize logger


auth_password = HrrRbSsh::Authentication::Authenticator.new { |context|
  user_and_pass = [
    ['user1',  'password1'],
    ['user2',  'password2'],
  ]
  user_and_pass.any? { |user, pass|
    context.verify user, pass
  }
}

conn_echo = HrrRbSsh::Connection::RequestHandler.new { |context|
  context.chain_proc { |chain|
    begin
      loop do
        buf = context.io.readpartial(10240)
        break if buf.include?(0x04.chr) # break if ^D
        context.io.write buf
      end
      exitstatus = 0
    rescue => e
      logger.error([e.backtrace[0], ": ", e.message, " (", e.class.to_s, ")\n\t", e.backtrace[1..-1].join("\n\t")].join)
      exitstatus = 1
    end
    exitstatus
  }
}

options = {}
options['authentication_password_authenticator'] = auth_password
options['connection_channel_request_shell']      = conn_echo


server = TCPServer.new 10022
while true
  t = Thread.new(server.accept) do |io|
    begin
      tran = HrrRbSsh::Transport.new      io, HrrRbSsh::Transport::Mode::SERVER
      auth = HrrRbSsh::Authentication.new tran, options
      conn = HrrRbSsh::Connection.new     auth, options
      conn.start
    rescue => e
      logger.error([e.backtrace[0], ": ", e.message, " (", e.class.to_s, ")\n\t", e.backtrace[1..-1].join("\n\t")].join)
    ensure
      io.close
    end
  end
end
