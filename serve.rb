require "socket"

server = TCPServer.open(2626)
puts "listening on 2626"

CLIENTS = []

def send_message(message)
  CLIENTS.each do | client |
    client.puts message
  end
end

while client=server.accept
  CLIENTS.push(client)
  Thread.fork do
    while input = client.gets
      send_message(input)
    end
  end
end
