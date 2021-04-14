import ws from 'nodejs-websocket';
const server = ws
  .createServer((conn) => {
    console.log('ok');
    conn.on('text', (str) => {
      broadcast(str);
    });
    conn.on('error', (err) => {
      console.log(err);
    });
  })
  .listen(9000);
function broadcast(data) {
  server.connections.forEach((conn) => {
    console.log(conn.key);
    conn.sendText(data);
  });
}
