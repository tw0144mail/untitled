import 'package:flutter/material.dart';
import 'package:untitled/common_import.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketRoute extends StatefulWidget {
  const WebSocketRoute({Key? key}) : super(key: key);

  @override
  _WebSocketRouteState createState() => _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  final TextEditingController _controller = TextEditingController();

  late IOWebSocketChannel channel;
  String _text = "";


  @override
  void initState() {
    //創建websocket連接
    channel = IOWebSocketChannel.connect('ws://echo.websocket.events');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.WebSocketsPage,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                //網路不通會走到這
                if (snapshot.hasError) {
                  _text = "網路不通...";
                } else if (snapshot.hasData) {
                  _text = "echo: "+snapshot.data.toString();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(_text),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}