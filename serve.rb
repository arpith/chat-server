require "socket"

server = TCPServer.open(2626)
puts "listening on 2626"
parent_socket, child_socket = UNIXSocket.pair

while session=server.accept
  fork do
    while request = session.gets
      #child_socket.send(request, 0)
      parent_socket.send(request, 0)
      from_parent = child_socket.recv(100)
      session.puts from_parent
    end
  end
end
