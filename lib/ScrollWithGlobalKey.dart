import 'package:flutter/material.dart';

class ScrollWithGlobalKey extends StatefulWidget {
  @override
  _ScrollWithGlobalKeyState createState() => _ScrollWithGlobalKeyState();
}

class _ScrollWithGlobalKeyState extends State<ScrollWithGlobalKey> {
  final scrollKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll With Key"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 500,
                color: Colors.yellow,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 500,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 500,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 300,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 500,
                color: Colors.pink,
                key: scrollKey,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Scrollable.ensureVisible(scrollKey.currentContext);
          print(scrollKey.toString());
        },
        child: Icon(
          Icons.arrow_downward,
          size: 30,
        ),
      ),
    );
  }
}
