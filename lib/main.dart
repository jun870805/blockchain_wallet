import 'package:flutter/material.dart';
import 'styles/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        extensions: <ThemeExtension<BWThemeData>>[
          const BWThemeData(
            color: BWColor.bright(),
            shadow: BWShadow.bright(),
            typography: BWTypography(),
          ),
        ],
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        extensions: <ThemeExtension<BWThemeData>>[
          const BWThemeData(
            color: BWColor.dark(),
            shadow: BWShadow.dark(),
            typography: BWTypography(),
          ),
        ],
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
