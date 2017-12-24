require 'socket'
if ARGV.empty?
	puts "Error, Please set a port by giving it as an argument"
	exit
end

PORT = ARGV.first.to_i

def handle_connection(client)
	puts "New Client! #{client}"

	client.write("Hello from server")
	client.close
end

socket = TCPServer.new('127.0.0.1', PORT)
puts "Listening on #{PORT}. Press CTRL+C to cancel"

while client = socket.accept
	Thread.new { handle_connection(client)}
end



