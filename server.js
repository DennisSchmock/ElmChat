/*
 * A websocket server in node.
 * Documentation available here: https://www.npmjs.com/package/nodejs-websocket
 */

var ws = require("nodejs-websocket");
var port = process.env.PORT || 3000;

var server = ws.createServer(function (conn) {
  conn.on("text", function (str) {
    //console.log("Got text" + str)
    try {
      //console.log("Test");
      var object = JSON.parse(str);
      console.log( object)
      if (object.command == "login") {
        broadcast("login", object.content)
      } else {
        broadcast("send", object.content,object.userName)
      }
    } catch (exception) {
      // JSON deserialisation failed
      console.log ("parse failed :" + str)
      broadcast("send", str)
    }
  })

  conn.on("close", function (code, reason) {
    console.log("Connection closed", code, reason)
  })
});
server.listen(port);
console.log("Listening on port ", port)

function jsonMessage(command, content,userName) {
  return JSON.stringify({
    command: command,
    content: content,
    userName: userName
  });
}

function broadcast(command, content,userName) {
  server.connections.forEach(function (connection) {
    console.log("Sending ", jsonMessage(command, content))
    connection.sendText(jsonMessage(command, content,userName));
  });
}
