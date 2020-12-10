import 'dart:convert';
import 'dart:io';
import 'dart:async';

Future<String> myServer(String text, type)async{
  Socket.connect('127.0.0.1', 9090).then((socket) {
  socket.write(text + type);
  });

  var serverSocket = await ServerSocket.bind("127.0.0.1", 9090);
  String output;
  serverSocket.listen((socket) {
        socket.cast<List<int>>().transform(utf8.decoder).listen((txt) {output = txt;});
    });
  return output;
}

