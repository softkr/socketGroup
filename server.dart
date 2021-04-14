import 'dart:io';

main() async {
  HttpServer server = await HttpServer.bind('localhost', 9000);
  server.transform(new WebSocketTransformer()).listen((WebSocket Socket) {
    Socket.listen((message) {
      print(message);
      Socket.add("{'msg':'받았습니다.'}");
      Socket.close();
    }, onDone: () {
      print('종료');
    });
  });
  print('Listening..');
}
