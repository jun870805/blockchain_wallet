import 'package:flutter/material.dart';
import 'package:blockchain_wallet/shared/styles/styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '妳好',
          style: TextStyle(
            fontFamily: 'MicrosoftJhengHei',
            fontWeight: FontWeight.normal,
            color: Theme.of(context).extension<BWThemeData>()!.color.title,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontFamily: 'MicrosoftJhengHei',
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '妳好',
              style: TextStyle(
                fontFamily: 'MicrosoftJhengHei',
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              '妳好',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
