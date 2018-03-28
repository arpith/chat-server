require "socket"

server = TCPServer.open(2626)
puts "listening on 2626"
parent_socket, child_socket = UNIXSocket.pair

CLIENTS = []

def send_message(message)
  puts CLIENTS.size
  CLIENTS.each do | client |
    client.puts message
  end
end

while client=server.accept
  CLIENTS.push(client)
  fork do
    while input = client.gets
      child_socket.send(send_message(input)
      #child_socket.send(request, 0)
      #puts input_line
      #parent_socket.send(input_line, 0)
      #output_line = child_socket.recv(100)
      #puts output_line
      #session.puts output_line
    end
  end
end
