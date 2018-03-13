# chat-server
A simple chat server that listens for connections. 

When a connection arrives, it creates a new thread to handle that connection (maintaining a list of connections). 

When a string arrives on any connection, the server will forward that string to all other connections.
