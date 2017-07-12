require "socket"

#server
host = 'localhost'
port = '23'
server = TCPServer.open(host,port)
welcome = "Welcome to a Honeypot!\n"

# logfile
$stdout = File.new( 'server.log', 'w' )
$stdout.sync = true

loop {# Servers run forever

   Thread.start(server.accept) do |client| #

	
   	# Connection Data
	peer_family, peer_port , peer_name, peer_ip = client.peeraddr
        server_family, server_port, server_name, server_ip = client.addr

	# Login
	client.puts welcome
	client.puts "Server:\t#{server_ip}:#{server_port}"
	client.puts "Client:\t#{peer_ip}:#{peer_port}\n"
	puts "+Client:\t#{peer_ip}:#{peer_port}\n"	# Client connected
	client.print 'Login: '
	user = client.gets.chomp
	client.print 'Password: '
	password = client.gets.chomp

	# Interaction
	loop do
		client.write("# ")	# Prompt
		cmd = client.gets.chomp	# Command
		break if cmd =~ /quit/	# Quit
		client.puts "sh: #{cmd.split.first}: command not found"
	end
	
	client.puts "Bye!"
	client.puts(Time.now.ctime) # Time
	client.puts "Closing the connection. Bye!"
	puts "-Client:\t#{peer_ip}:#{peer_port}\n" # Client disconnected
	client.close                # Disconnect
end

}



