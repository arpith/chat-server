require "socket"

server = TCPServer.open(2626)
parent_socket, child_socket = UNIXSocket.pair

while session=server.accept
  fork do
    request = session.gets
    parent_socket.close
    child_socket.send(request, 0)
    from_parent = child_socket.recv(100)
    session.puts from_parent
  end
  child_socket.close
  parent_socket.send("sent from parent (#{$$})", 0)
  from_child = parent_socket.recv(100)
end
