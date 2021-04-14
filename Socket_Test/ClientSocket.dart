/*
 * @Description: 
 * @Author: Elijah Roh
 * @Date: 2021-03-26 17:52:31
 * @LastEditTime: 2021-04-01 11:09:37
 * @LastEditors: Elijah Roh
 */
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

void main() async {
  // connect to the socket server
  final socket = await Socket.connect('localhost', 10101);
  print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

  // listen for responses from the server
  socket.listen(
    // handle data from the server
    (Uint8List data) {
      final serverResponse = String.fromCharCodes(data);
      var dd = utf8.decode(data);
      print('object$dd');
      print('Server: $serverResponse');
    },

    // handle errors
    onError: (error) {
      print(error);
      socket.destroy();
    },

    // handle server ending connection
    onDone: () {
      print('Server left.');
      socket.destroy();
    },
  );

  // send some messages to the server
  await sendMessage(socket, '20IHPA00170A');
  await sendMessage(socket, '');
  await sendMessage(socket, '');
  await sendMessage(socket, '');
  await sendMessage(socket, '');
  await sendMessage(socket, '');
  await sendMessage(socket, '');
  await sendMessage(socket, '');
  socket.destroy();
}

Future<void> sendMessage(Socket socket, String message) async {
  print('Client: $message');
  socket.write(message);
  await Future.delayed(Duration(seconds: 2));
}
