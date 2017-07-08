require "socket"

server = TCPServer.new("0.0.0.0", 23)

loop do
        Thread.start(server.accept) do |client|
                peer_family, peer_port , peer_name, peer_ip = client.peeraddr
                server_family, server_port, server_name, server_ip = client.addr
                puts "Client:\t#{peer_ip}:#{peer_port}"
                puts "Server:\t#{server_ip}:#{server_port}"
                #puts client.encoding
                client.puts "Welcome to a vulnerable IoT device!"
                client.write "\nLogin: "
                user = client.gets.chomp
                puts user.encoding
                user.force_encoding('ISO-8859-1').encode('utf-8')
                puts user.encoding
                #user.force_encoding( 'ISO-8859-8' )
                #user.encode( 'utf-8' )
                puts user
                client.write "Password: "
                pass = client.gets.chomp
                puts "Login:\t#{user}:#{pass}@#{peer_ip}"
                client.puts
                loop do
                        client.write("# ")
                        cmd = client.gets.chomp
                        puts "#{peer_ip}:\t#{cmd}"
                        client.puts "sh: #{cmd.split.first}: command not found"
                end
        end
end