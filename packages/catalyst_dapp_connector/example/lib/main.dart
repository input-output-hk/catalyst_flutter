import 'package:flutter/material.dart';
import 'package:catalyst_dapp_connector/catalyst_dapp_connector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Catalyst dApp connector',
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _connectionStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
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
              child: const Text('Connect to Nufi wallet'),
            ),
            const SizedBox(height: 16.0),
            Text(_connectionStatus),
          ],
        ),
      ),
    );
  }
}
