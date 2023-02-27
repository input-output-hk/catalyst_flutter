import 'package:flutter/material.dart';
import 'package:catalyst_dapp_connector/catalyst_dapp_connector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _connectionStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  String status = await connect('nufi');
                  setState(() {
                    _connectionStatus = status;
                  });
                } catch (e) {
                  setState(() {
                    _connectionStatus = 'Error: $e';
                  });
                }
              },
              child: Text('Connect to Nufi wallet'),
            ),
            SizedBox(height: 16.0),
            Text(_connectionStatus),
          ],
        ),
      ),
    );
  }
}
