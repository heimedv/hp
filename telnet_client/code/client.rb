require 'net/telnet'

# Server
host = '10.11.1.1'
port = '23'

# looping random Telnet Connection
loop do
	
	# connect to server
	server = Net::Telnet::new("Host" => host,"Port" =>
		23,"Telnetmode" => false, "Prompt" => /#/,)  { |str| puts str }
	# login
	server.login("user", "pass") { |c| print c }
	# wait
  sleep(rand(2...6))
	# quit	
	server.cmd('quit'){ |c| puts c }
	server.close
	puts
end
