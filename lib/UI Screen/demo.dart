import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (_counter > 0) {
                    _counter--;
                  }
                });
              },
            ),
            SizedBox(width: 16),
            Text(
              _counter.toString(),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(width: 16),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
